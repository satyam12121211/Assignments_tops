import 'package:flutter/material.dart';

class ToggleBackground extends StatefulWidget {
  const ToggleBackground({super.key});

  @override
  State<ToggleBackground> createState() => _ToggleBackgroundState();
}

class _ToggleBackgroundState extends State<ToggleBackground> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: Center(
        child: SwitchListTile(
          value: isDark,
          onChanged: (val) => setState(() => isDark = val),
          title: Text('Dark Mode', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}