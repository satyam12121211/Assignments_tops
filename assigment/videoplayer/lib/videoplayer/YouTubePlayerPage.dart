import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer/videoplayer/VideoProvider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubePlayerPage extends StatefulWidget {
  const YouTubePlayerPage({super.key});

  @override
  _YouTubePlayerPageState createState() => _YouTubePlayerPageState();
}

class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
  final _urlController = TextEditingController();
  YoutubePlayerController? _controller;

  void _playYouTubeVideo() {
    final url = _urlController.text; // Fixed: Correctly reference _urlController.text
    final videoId = _extractVideoId(url);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          playsInline: true,
        ),
      )..loadVideoById(videoId: videoId);
      Provider.of<VideoProvider>(context, listen: false).addVideoHistory('YouTube: $url');
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid YouTube URL')),
      );
    }
  }

  String? _extractVideoId(String url) {
    final regex = RegExp(r'(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})');
    final match = regex.firstMatch(url);
    return match?.group(1);
  }

  @override
  void dispose() {
    _controller?.close();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Video Player'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _urlController,
                        decoration: InputDecoration(
                          labelText: 'Enter YouTube URL',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.link, color: Colors.brown),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _playYouTubeVideo,
                        child: const Text('Play Video', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ),
              if (_controller != null)
                Expanded(
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: _controller!,
                        aspectRatio: 16 / 9, // Fixed: Corrected from aspect-ratio to aspectRatio
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}