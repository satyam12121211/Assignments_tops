import 'package:appdevelopment/Homescreen.dart';
import 'package:appdevelopment/detailscreen.dart';
import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<TravelDestination> searchResults = [];
  List<TravelDestination> allDestinations = [];

  @override
  void initState() {
    super.initState();
    allDestinations = TravelRepository.getAllDestinations();
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    List<TravelDestination> results = [];
    for (var destination in allDestinations) {
      // Using control statements for search logic
      if (destination.name.toLowerCase().contains(query.toLowerCase()) ||
          destination.country.toLowerCase().contains(query.toLowerCase()) ||
          destination.category.toLowerCase().contains(query.toLowerCase())) {
        results.add(destination);
      }
    }

    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search destinations...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: _performSearch,
        ),
        backgroundColor: Colors.blue[600],
      ),
      body: searchResults.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 64, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text(
              searchController.text.isEmpty
                  ? 'Start typing to search destinations'
                  : 'No destinations found',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return _buildSearchResultItem(searchResults[index]);
        },
      ),
    );
  }

  Widget _buildSearchResultItem(TravelDestination destination) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 60,
            height: 60,
            child: Image.network(
              destination.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.image, color: Colors.grey[600]),
                );
              },
            ),
          ),
        ),
        title: Text(destination.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(destination.country),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.orange),
                Text(' ${destination.rating}'),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    destination.category,
                    style: TextStyle(fontSize: 12, color: Colors.blue[800]),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DestinationDetailScreen(destination: destination),
            ),
          );
        },
      ),
    );
  }
}
