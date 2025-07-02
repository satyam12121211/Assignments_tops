import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoProvider with ChangeNotifier {
  List<String> _videoHistory = [];

  List<String> get videoHistory => _videoHistory;

  VideoProvider() {
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    _videoHistory = prefs.getStringList('videoHistory') ?? [];
    notifyListeners();
  }

  Future<void> addVideoHistory(String video) async {
    _videoHistory.insert(0, video);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('videoHistory', _videoHistory);
    notifyListeners();
  }

  Future<void> removeVideoHistory(int index) async {
    _videoHistory.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('videoHistory', _videoHistory);
    notifyListeners();
  }
}
