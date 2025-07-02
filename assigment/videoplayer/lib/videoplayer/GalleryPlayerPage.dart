import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:videoplayer/videoplayer/VideoProvider.dart';

class GalleryPlayerPage extends StatefulWidget {
  const GalleryPlayerPage({super.key});

  @override
  _GalleryPlayerPageState createState() => _GalleryPlayerPageState();
}

class _GalleryPlayerPageState extends State<GalleryPlayerPage> {
  VideoPlayerController? _controller;

  Future<void> _pickAndPlayVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      _controller = VideoPlayerController.file(File(filePath))
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
          Provider.of<VideoProvider>(context, listen: false).addVideoHistory('Gallery: $filePath');
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Video Player'),
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
        child: Center(
          child: _controller != null && _controller!.value.isInitialized
              ? Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  VideoProgressIndicator(_controller!, allowScrubbing: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 36,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
              : Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.video_library, size: 64, color: Colors.brown),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _pickAndPlayVideo,
                    child: const Text('Pick Video from Gallery', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}