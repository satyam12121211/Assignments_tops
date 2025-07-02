import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer/videoplayer/VideoProvider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final videoHistory = Provider.of<VideoProvider>(context).videoHistory;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video History'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.brown[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown[100]!, Colors.brown[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: videoHistory.isEmpty
            ? const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.history_toggle_off, size: 64, color: Colors.brown),
              SizedBox(height: 16),
              Text(
                'No videos played yet',
                style: TextStyle(fontSize: 18, color: Colors.brown, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: videoHistory.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.video_file, color: Colors.brown),
                title: Text(
                  videoHistory[index],
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => Provider.of<VideoProvider>(context, listen: false).removeVideoHistory(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}