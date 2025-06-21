import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Centralized menu prices and icons
const Map<String, double> menuPrices = {
  'Tea': 20.0,
  'Coffee': 30.0,
  'Sugar': 5.0,
  'Milk': 10.0,
  'Snacks': 50.0,
};

const Map<String, IconData> menuIcons = {
  'Tea': Icons.local_drink,
  'Coffee': Icons.coffee,
  'Sugar': Icons.cake,
  'Milk': Icons.water_drop,
  'Snacks': Icons.fastfood,
};

class Order {
  final String id;
  final List<String> items;
  final String comments;
  final double total;
  final DateTime timestamp;

  Order({
    required this.id,
    required this.items,
    required this.comments,
    required this.total,
    required this.timestamp,
  });
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Order> _orderHistory = [];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OrderPage(orderHistory: _orderHistory),
      OrderHistoryPage(orderHistory: _orderHistory),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5E6CC), Color(0xFFE6D5B8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe),
            activeIcon: Icon(Icons.local_cafe, size: 28),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            activeIcon: Icon(Icons.history, size: 28),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown[800],
        unselectedItemColor: Colors.brown[400],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  final List<Order> orderHistory;
  const OrderPage({super.key, required this.orderHistory});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  final TextEditingController _commentsController = TextEditingController();
  final List<String> _selectedItems = [];
  final _formKey = GlobalKey<FormState>();
  late AnimationController _buttonAnimationController;

  double get _totalPrice {
    return _selectedItems.fold(0.0, (sum, item) => sum + (menuPrices[item] ?? 0.0));
  }

  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  void _clearForm() {
    setState(() {
      _selectedItems.clear();
      _commentsController.clear();
    });
  }

  void _placeOrder() {
    if (_selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one item')),
      );
      return;
    }

    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: List.from(_selectedItems),
      comments: _commentsController.text.trim(),
      total: _totalPrice,
      timestamp: DateTime.now(),
    );

    setState(() {
      widget.orderHistory.add(order);
    });

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, anim1, anim2) => BillDialog(order: order),
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(anim1),
          child: child,
        );
      },
    ).then((_) => _clearForm());
  }

  @override
  void dispose() {
    _commentsController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tea & Coffee Order'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  OrderHistoryPage(orderHistory: widget.orderHistory),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        backgroundColor: Colors.brown[600],
        child: const Icon(Icons.history),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuSelector(
                selectedItems: _selectedItems,
                onItemToggled: (item) {
                  setState(() {
                    if (_selectedItems.contains(item)) {
                      _selectedItems.remove(item);
                    } else {
                      _selectedItems.add(item);
                    }
                  });
                },
              ),
              const SizedBox(height: 16),
              CommentsField(controller: _commentsController),
              const SizedBox(height: 16),
              TotalPrice(total: _totalPrice),
              const SizedBox(height: 16),
              OrderButtons(
                onPlaceOrder: _placeOrder,
                onClear: _clearForm,
                animationController: _buttonAnimationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuSelector extends StatelessWidget {
  final List<String> selectedItems;
  final Function(String) onItemToggled;

  const MenuSelector({
    super.key,
    required this.selectedItems,
    required this.onItemToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Items',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: menuPrices.keys.map((item) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: ChoiceChip(
                avatar: Icon(
                  menuIcons[item],
                  size: 18,
                  color: selectedItems.contains(item) ? Colors.brown[800] : Colors.brown[400],
                ),
                label: Text('$item (₹${menuPrices[item]})'),
                selected: selectedItems.contains(item),
                onSelected: (_) => onItemToggled(item),
                selectedColor: Colors.brown[100],
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: selectedItems.contains(item) ? Colors.brown[800] : Colors.brown[600],
                  fontWeight: FontWeight.w500,
                ),
                elevation: selectedItems.contains(item) ? 4 : 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CommentsField extends StatelessWidget {
  final TextEditingController controller;
  const CommentsField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Add Comments',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        prefixIcon: const Icon(Icons.comment, color: Colors.brown),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.brown, width: 2),
        ),
      ),
      maxLines: 3,
    );
  }
}

class TotalPrice extends StatelessWidget {
  final double total;
  const TotalPrice({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        'Total: ₹${total.toStringAsFixed(2)}',
        key: ValueKey(total),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
    );
  }
}

class OrderButtons extends StatelessWidget {
  final VoidCallback onPlaceOrder;
  final VoidCallback onClear;
  final AnimationController animationController;

  const OrderButtons({
    super.key,
    required this.onPlaceOrder,
    required this.onClear,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScaleTransitionButton(
          onPressed: onPlaceOrder,
          animationController: animationController,
          child: ElevatedButton.icon(
            onPressed: onPlaceOrder,
            icon: const Icon(Icons.check),
            label: const Text('Place Order'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[600],
              foregroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        ScaleTransitionButton(
          onPressed: onClear,
          animationController: animationController,
          child: OutlinedButton.icon(
            onPressed: onClear,
            icon: const Icon(Icons.clear),
            label: const Text('Clear'),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.brown[600]!),
              foregroundColor: Colors.brown[600],
            ),
          ),
        ),
      ],
    );
  }
}

class ScaleTransitionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final AnimationController animationController;
  final Widget child;

  const ScaleTransitionButton({
    super.key,
    required this.onPressed,
    required this.animationController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => animationController.forward(),
      onTapUp: (_) {
        animationController.reverse();
        onPressed();
      },
      onTapCancel: () => animationController.reverse(),
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.95).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}

class BillDialog extends StatelessWidget {
  final Order order;

  const BillDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Order Bill'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...order.items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item),
                  Text('₹${(menuPrices[item] ?? 0.0).toStringAsFixed(2)}'),
                ],
              ),
            )),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹${order.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            if (order.comments.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text('Comments: ${order.comments}', style: const TextStyle(fontStyle: FontStyle.italic)),
            ],
            const SizedBox(height: 8),
            Text(
              'Time: ${DateFormat('dd MMM yyyy, HH:mm').format(order.timestamp)}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK', style: TextStyle(color: Colors.brown)),
        ),
      ],
    );
  }
}

class OrderHistoryPage extends StatefulWidget {
  final List<Order> orderHistory;
  const OrderHistoryPage({super.key, required this.orderHistory});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animations = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _animations = List.generate(
            widget.orderHistory.length,
                (index) => Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Interval(
                  index * 0.1,
                  (index * 0.1) + 0.5,
                  curve: Curves.easeOut,
                ),
              ),
            ),
          );
        });
        _animationController.forward();
      }
    });
  }

  @override
  void didUpdateWidget(covariant OrderHistoryPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.orderHistory.length != oldWidget.orderHistory.length) {
      _animationController.reset();
      setState(() {
        _animations = List.generate(
          widget.orderHistory.length,
              (index) => Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval(
                index * 0.1,
                (index * 0.1) + 0.5,
                curve: Curves.easeOut,
              ),
            ),
          ),
        );
      });
      _animationController.forward();
    }
  }

  void _deleteOrder(BuildContext context, String id) {
    setState(() {
      widget.orderHistory.removeWhere((order) => order.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order deleted')),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: widget.orderHistory.isEmpty
          ? const Center(child: Text('No orders yet', style: TextStyle(fontSize: 16)))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.orderHistory.length,
        itemBuilder: (context, index) {
          final order = widget.orderHistory[index];
          return FadeTransition(
            opacity: _animations.isNotEmpty ? _animations[index] : const AlwaysStoppedAnimation(1.0),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.5, 0),
                end: Offset.zero,
              ).animate(_animations.isNotEmpty ? _animations[index] : const AlwaysStoppedAnimation(1.0)),
              child: Dismissible(
                key: Key(order.id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => _deleteOrder(context, order.id),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown[100],
                      child: const Icon(Icons.receipt, color: Colors.brown),
                    ),
                    title: Text(
                      order.items.join(', '),
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    subtitle: Text(
                      'Total: ₹${order.total.toStringAsFixed(2)}\n'
                          '${order.comments.isNotEmpty ? 'Comments: ${order.comments}\n' : ''}'
                          '${DateFormat('dd MMM yyyy, HH:mm').format(order.timestamp)}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    onTap: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                        pageBuilder: (context, anim1, anim2) => BillDialog(order: order),
                        transitionDuration: const Duration(milliseconds: 300),
                        transitionBuilder: (context, anim1, anim2, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(anim1),
                            child: child,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}