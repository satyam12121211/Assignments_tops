import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videoplayer/videoplayer/LoginPage.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();
  final _newPasswordController = TextEditingController();
  String? _errorMessage;

  Future<void> _resetPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');

    if (savedEmail == _emailController.text) {
      await prefs.setString('password', _newPasswordController.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
    } else {
      setState(() {
        _errorMessage = 'Email not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _newPasswordController,
              decoration: const InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
              ),
            ElevatedButton(
              onPressed: _resetPassword,
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

