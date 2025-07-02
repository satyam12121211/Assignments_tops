import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videoplayer/videoplayer/GalleryPlayerPage.dart';
import 'package:videoplayer/videoplayer/HistoryPage.dart';
import 'package:videoplayer/videoplayer/LoginPage.dart';
import 'package:videoplayer/videoplayer/YouTubePlayerPage.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoStream'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.brown[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown[700]!, Colors.brown[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Text(
                'VideoStream',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.brown),
              title: const Text('Home', style: TextStyle(fontSize: 16)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.brown),
              title: const Text('History', style: TextStyle(fontSize: 16)),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryPage())),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.brown),
              title: const Text('Logout', style: TextStyle(fontSize: 16)),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown[100]!, Colors.brown[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(Icons.video_library, size: 48, color: Colors.brown),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GalleryPlayerPage())),
                          child: const Text('Play Gallery Video', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(Icons.play_circle_filled, size: 48, color: Colors.brown),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const YouTubePlayerPage())),
                          child: const Text('Play YouTube Video', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}