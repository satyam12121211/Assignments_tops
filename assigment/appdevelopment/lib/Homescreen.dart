import 'package:appdevelopment/detailscreen.dart';
import 'package:appdevelopment/searchscreen.dart';
import 'package:appdevelopment/topratedscreen.dart';
import 'package:flutter/material.dart';
// Model class for Travel Destination
class TravelDestination {
  final String id;
  final String name;
  final String country;
  final String description;
  final String imageUrl;
  final double rating;
  final String category;
  final List<String> attractions;
  final String bestTime;
  final String duration;

  TravelDestination({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.category,
    required this.attractions,
    required this.bestTime,
    required this.duration,
  });
}

// Data Repository using Collections
class TravelRepository {
  static List<TravelDestination> _destinations = [
    TravelDestination(
      id: '1',
      name: 'Paris',
      country: 'France',
      description: 'The City of Light, famous for its art, fashion, and culture.',
      imageUrl: 'https://images.unsplash.com/photo-1502602898536-47ad22581b52?w=400',
      rating: 4.8,
      category: 'Cultural',
      attractions: ['Eiffel Tower', 'Louvre Museum', 'Notre-Dame'],
      bestTime: 'April-October',
      duration: '4-5 Days',
    ),
    TravelDestination(
      id: '2',
      name: 'Tokyo',
      country: 'Japan',
      description: 'A vibrant metropolis blending tradition and modernity.',
      imageUrl: 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=400',
      rating: 4.7,
      category: 'Urban',
      attractions: ['Tokyo Tower', 'Senso-ji Temple', 'Shibuya Crossing'],
      bestTime: 'March-May, September-November',
      duration: '5-7 Days',
    ),
    TravelDestination(
      id: '3',
      name: 'Bali',
      country: 'Indonesia',
      description: 'Tropical paradise with stunning beaches and rich culture.',
      imageUrl: 'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=400',
      rating: 4.6,
      category: 'Beach',
      attractions: ['Uluwatu Temple', 'Rice Terraces', 'Seminyak Beach'],
      bestTime: 'April-October',
      duration: '5-8 Days',
    ),
    TravelDestination(
      id: '4',
      name: 'New York',
      country: 'USA',
      description: 'The Big Apple - a city that never sleeps.',
      imageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=400',
      rating: 4.5,
      category: 'Urban',
      attractions: ['Statue of Liberty', 'Central Park', 'Times Square'],
      bestTime: 'April-June, September-November',
      duration: '4-6 Days',
    ),
    TravelDestination(
      id: '5',
      name: 'Santorini',
      country: 'Greece',
      description: 'Picturesque island with white-washed buildings and blue domes.',
      imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=400',
      rating: 4.9,
      category: 'Beach',
      attractions: ['Oia Sunset', 'Red Beach', 'Akrotiri'],
      bestTime: 'May-September',
      duration: '3-5 Days',
    ),
    TravelDestination(
      id: '6',
      name: 'Dubai',
      country: 'UAE',
      description: 'Modern oasis in the desert with luxury and innovation.',
      imageUrl: 'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=400',
      rating: 4.4,
      category: 'Luxury',
      attractions: ['Burj Khalifa', 'Palm Jumeirah', 'Dubai Mall'],
      bestTime: 'November-March',
      duration: '3-4 Days',
    ),
  ];

  // Using control statements and collections
  static List<TravelDestination> getAllDestinations() {
    return List.from(_destinations);
  }

  static List<TravelDestination> getDestinationsByCategory(String category) {
    List<TravelDestination> filtered = [];
    for (var destination in _destinations) {
      if (destination.category.toLowerCase() == category.toLowerCase()) {
        filtered.add(destination);
      }
    }
    return filtered;
  }

  static List<TravelDestination> getTopRatedDestinations() {
    List<TravelDestination> topRated = List.from(_destinations);
    topRated.sort((a, b) => b.rating.compareTo(a.rating));
    return topRated.take(3).toList();
  }

  static List<String> getCategories() {
    Set<String> categories = {};
    for (var destination in _destinations) {
      categories.add(destination.category);
    }
    return categories.toList();
  }

  static TravelDestination? getDestinationById(String id) {
    for (var destination in _destinations) {
      if (destination.id == id) {
        return destination;
      }
    }
    return null;
  }
}

// Home Screen with Grid Layout
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TravelDestination> destinations = [];
  String selectedCategory = 'All';
  List<String> categories = ['All'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    destinations = TravelRepository.getAllDestinations();
    categories.addAll(TravelRepository.getCategories());
    setState(() {});
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        destinations = TravelRepository.getAllDestinations();
      } else {
        destinations = TravelRepository.getDestinationsByCategory(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Guidance'),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String category = categories[index];
                bool isSelected = selectedCategory == category;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) => _filterByCategory(category),
                    backgroundColor: Colors.grey[200],
                    selectedColor: Colors.blue[100],
                  ),
                );
              },
            ),
          ),
          // Grid Layout for destinations
          Expanded(
            child: _buildDestinationGrid(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TopRatedScreen()),
          );
        },
        child: Icon(Icons.star),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Widget _buildDestinationGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive grid based on screen width
        int crossAxisCount;
        if (constraints.maxWidth < 600) {
          crossAxisCount = 2; // Mobile
        } else if (constraints.maxWidth < 900) {
          crossAxisCount = 3; // Tablet
        } else {
          crossAxisCount = 4; // Desktop
        }

        return GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            return _buildDestinationCard(destinations[index]);
          },
        );
      },
    );
  }

  Widget _buildDestinationCard(TravelDestination destination) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DestinationDetailScreen(destination: destination),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with placeholder
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    destination.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Content
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    Text(
                      destination.country,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        SizedBox(width: 2),
                        Text(
                          destination.rating.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            destination.category,
                            style: TextStyle(fontSize: 10, color: Colors.blue[800]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
