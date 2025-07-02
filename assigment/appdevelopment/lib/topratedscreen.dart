import 'package:appdevelopment/Homescreen.dart';
import 'package:appdevelopment/detailscreen.dart';
import 'package:flutter/material.dart';
class TopRatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<TravelDestination> topRated = TravelRepository.getTopRatedDestinations();

    return Scaffold(
        appBar: AppBar(
          title: Text('Top Rated Destinations'),
          backgroundColor: Colors.orange[600],
        ),
        body: ListView.builder(
            itemCount: topRated.length,
            itemBuilder: (context, index) {
              TravelDestination destination = topRated[index];
              return Card(
                margin: EdgeInsets.all(16),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
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
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            destination.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: Icon(Icons.image, size: 80, color: Colors.grey[600]),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${index + 1}. ${destination.name}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orange, size: 24),
                                    Text(
                                      destination.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              destination.country,
                              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(height: 8),
                            Text(
                              destination.description,
                              style: TextStyle(fontSize: 14, height: 1.4),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            ),
        );
    }
}