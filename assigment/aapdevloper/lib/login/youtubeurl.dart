import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubePlayerPage extends StatefulWidget {
  const YouTubePlayerPage({super.key});

  @override
  State<YouTubePlayerPage> createState() => _YouTubePlayerPageState();
}

class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
  final TextEditingController _controller = TextEditingController();
  YoutubePlayerController? _youtubePlayerController;
  String? _errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    _youtubePlayerController?.close();
    super.dispose();
  }

  String? _extractVideoId(String url) {
    // Regular expression to match YouTube video IDs, including Shorts
    RegExp regExp = RegExp(
      r'^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?)|(/shorts\/))\??v?=?([^#\&\?]*).*',
      caseSensitive: false,
      multiLine: false,
    );
    Match? match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 8 && match.group(8)!.length == 11) {
      return match.group(8);
    }
    return null;
  }

  void _playVideo() {
    String url = _controller.text.trim();
    String? videoId = _extractVideoId(url);

    if (videoId != null) {
      setState(() {
        _errorMessage = null;
        _youtubePlayerController?.close();
        _youtubePlayerController = YoutubePlayerController(
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,

          ),
        )..loadVideoById(videoId: videoId);
      });
    } else {
      setState(() {
        _errorMessage = 'Invalid YouTube URL';
        _youtubePlayerController?.close();
        _youtubePlayerController = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Video Player'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter YouTube URL',
                border: const OutlineInputBorder(),
                errorText: _errorMessage,
              ),
              keyboardType: TextInputType.url,
              onSubmitted: (_) => _playVideo(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _playVideo,
              child: const Text('Play Video'),
            ),
            const SizedBox(height: 16),
            if (_youtubePlayerController != null)
              Expanded(
                child: YoutubePlayer(
                  controller: _youtubePlayerController!,
                  aspectRatio: 16 / 9,
                ),
              ),
          ],
        ),
      ),
    );
  }
}