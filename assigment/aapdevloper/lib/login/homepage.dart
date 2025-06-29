import 'dart:convert';
import 'dart:io';
import 'package:aapdevloper/login/youtubeurl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aapdevloper/login/logindart.dart';
import 'package:aapdevloper/login/resetpassword.dart';
import 'package:aapdevloper/login/widgits.dart';
import 'package:aapdevloper/login/newwidget.dart';
import 'History.dart';
import 'Thankyou page.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const logindart()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Haven'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to cart page (can be added later)
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: MyDrawer(onLogout: () => logout(context)),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  HomeBodyState createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  String _currentImage = '';
  String _selectedSugar = 'Normal Sugar';
  List<Map<String, dynamic>> _billItems = [];
  static List<Map<String, dynamic>> _orderHistory = [];
  // Added: Favorites list
  List<Map<String, dynamic>> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadOrderHistory(); // Load order history on initialization
    _loadFavorites(); // Load favorites on initialization
  }

  // Added: Load order history from SharedPreferences
  Future<void> _loadOrderHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? history = prefs.getString('orderHistory');
      if (history != null) {
        setState(() {
          _orderHistory = List<Map<String, dynamic>>.from(jsonDecode(history));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading order history: $e')),
      );
    }
  }

  // Added: Save order history to SharedPreferences
  Future<void> _saveOrderHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('orderHistory', jsonEncode(_orderHistory));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving order history: $e')),
      );
    }
  }

  // Added: Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? favorites = prefs.getString('favorites');
      if (favorites != null) {
        setState(() {
          _favorites = List<Map<String, dynamic>>.from(jsonDecode(favorites));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading favorites: $e')),
      );
    }
  }

  // Added: Save favorites to SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('favorites', jsonEncode(_favorites));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving favorites: $e')),
      );
    }
  }

  // Modified: Add item to bill
  void _showImageAndAddToBill(String imagePath, String itemName, int price) {
    setState(() {
      _currentImage = imagePath;
      _billItems.add({
        'name': itemName,
        'price': price,
        'sugar': _selectedSugar,
        'date': DateTime.now().toString(),
      });
    });
  }

  // Added: Remove item from bill
  void _removeBillItem(int index) {
    setState(() {
      _billItems.removeAt(index);
      if (_billItems.isEmpty) {
        _currentImage = ''; // Reset image if bill is empty
      }
    });
  }

  // Added: Add item to favorites
  void _addToFavorites(String itemName, String imagePath) {
    setState(() {
      if (!_favorites.any((fav) => fav['name'] == itemName)) {
        _favorites.add({'name': itemName, 'image': imagePath});
        _saveFavorites();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$itemName added to favorites!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$itemName is already in favorites!')),
        );
      }
    });
  }

  // Modified: Place order with confirmation dialog
  void _placeOrder(BuildContext context) {
    if (_billItems.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirm Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total: ₹${_billItems.fold(0, (sum, item) => sum + (item['price'] as int))}'),
              Text('Items: ${_billItems.length}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _orderHistory.addAll(_billItems);
                  _billItems = [];
                  _currentImage = '';
                });
                _saveOrderHistory();
                Navigator.pop(context); // Close dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThankYouPage()),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add items to the bill first!')),
      );
    }
  }

  void _showOrderHistoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
            'Order History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          SizedBox(height: 16),
          _orderHistory.isEmpty
              ? Text(
              'No orders placed yet',
              style: TextStyle(fontSize: 16,color: Colors.grey),
        )
            : Expanded(
        child: ListView.builder(
        shrinkWrap: true,
        itemCount: _orderHistory.length,
        itemBuilder: (context, index) {
        final item = _orderHistory[index];
        return ListTile(
        title: Text(
        '${item['name']} (${item['sugar']})',
        style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(
        'Price: ₹${item['price']} | Date: ${item['date'].substring(0, 10)}',
        style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        );
        },
        ),
        ),
        SizedBox(height: 16),
        Center(
        child: ElevatedButton(
        onPressed: () {
        Navigator.pop(context); // Close the bottom sheet
        },
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
        'Close',
        style: TextStyle(color: Colors.white),
        ),
        ),
        ),
        ],
        ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = _billItems.fold(0, (sum, item) => sum + (item['price'] as int));

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.brown[100],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Choose Your Drink',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _showImageAndAddToBill('assets/Tea.jpg', 'Tea', 10),
                          child: const Text('Tea (₹10)', style: TextStyle(fontSize: 10)),
                        ),
                        TextButton(
                          onPressed: () => _addToFavorites('Tea', 'assets/Tea.jpg'),
                          child: Text('Add to Favorites', style: TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _showImageAndAddToBill('assets/Coffe (1).jpg', 'Coffee', 20),
                          child: const Text('Coffee (₹20)', style: TextStyle(fontSize: 10)),
                        ),
                        TextButton(
                          onPressed: () => _addToFavorites('Coffee', 'assets/Coffe (1).jpg'),
                          child: Text('Add to Favorites', style: TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _showImageAndAddToBill('assets/Milk.jpeg', 'Milk', 10),
                          child: const Text('Milk (₹10)', style: TextStyle(fontSize: 10)),
                        ),
                        TextButton(
                          onPressed: () => _addToFavorites('Milk', 'assets/Milk.jpeg'),
                          child: Text('Add to Favorites', style: TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedSugar,
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.brown),
                    style: TextStyle(color: Colors.brown, fontSize: 14),
                    items: ['No Sugar', 'Less Sugar', 'Normal Sugar']
                        .map((sugar) => DropdownMenuItem(
                      value: sugar,
                      child: Text(sugar),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSugar = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    image: _currentImage.isNotEmpty
                        ? DecorationImage(
                      image: AssetImage(_currentImage),
                      fit: BoxFit.cover,
                    )
                        : null,
                    color: _currentImage.isEmpty ? Colors.grey[200] : null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _currentImage.isEmpty
                      ? const Center(child: Text('Select a drink', style: TextStyle(fontSize: 16)))
                      : null,
                ),
              ],
            ),
          ),
          // Added: Favorites Section
          if (_favorites.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Favorites',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _favorites.length,
                      itemBuilder: (context, index) {
                        final favorite = _favorites[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Image.asset(favorite['image'], width: 50, height: 50),
                              Text(favorite['name'], style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Bill',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                ),
                const SizedBox(height: 12),
                _billItems.isEmpty
                    ? const Text('No items selected', style: TextStyle(color: Colors.grey))
                    : Column(
                  children: [
                    ..._billItems.asMap().entries.map((entry) {
                      int index = entry.key;
                      var item = entry.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '${index + 1}. ${item['name']} (${item['sugar']})',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              '₹${item['price']}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeBillItem(index),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const Divider(color: Colors.brown),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹$totalPrice',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _placeOrder(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text('Place Order'),
                    ),
                    ElevatedButton(
                      onPressed: () => _showOrderHistoryBottomSheet(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text('View History'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  final VoidCallback? onLogout;

  const MyDrawer({super.key, this.onLogout});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? Name;
  String? Email;
  String? Pass;
  String? profileImage;

  @override
  void initState() {
    super.initState();
    detail();
  }

  Future<void> detail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        Name = prefs.getString('name') ?? 'Guest';
        Email = prefs.getString('email') ?? 'No email';
        Pass = prefs.getString('pass') ?? 'No password';
        profileImage = prefs.getString('profileImage');
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading profile: $e')),
      );
    }
  }

  Widget buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 230,
            width: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: profileImage != null && profileImage!.isNotEmpty
                        ? FileImage(File(profileImage!))
                        : AssetImage('assets/profile.jpg') as ImageProvider,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Name ?? 'Guest',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    Email ?? 'No email',
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Text(
                    Pass ?? 'No password',
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.accessibility_new_sharp),
                title: const Text('Account'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubePlayerPage()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => logindart(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Reset Password'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const resetpassword()),
                  );
                },
              ),
              ExpansionTile(
                title: const Text('Pages'),
                leading: const Icon(Icons.add_business),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildDrawerItem('PageCreative', () {
                          try {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const widget()),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error navigating to PageCreative: $e')),
                            );
                          }
                        }),
                        buildDrawerItem('PageLottie', () {
                          try {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const newwidget()),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error navigating to PageLottie: $e')),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}