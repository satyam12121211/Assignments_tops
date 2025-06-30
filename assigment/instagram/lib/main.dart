// main.dart
import 'package:flutter/material.dart';
import 'package:instagram/insta/ForgotPasswordScreen.dart';
import 'package:instagram/insta/HomeScreen.dart';
import 'package:instagram/insta/LoginScreen.dart';
import 'package:instagram/insta/RegisterScreen.dart';
import 'package:instagram/insta/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}

// models/user_model.dart
class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}

// services/auth_service.dart
class AuthService {
  static const String _keyLoggedIn = 'user_logged_in';
  static const String _keyUserName = 'user_name';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserPassword = 'user_password';

  static Future<bool> register(String name, String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Check if user already exists
      String? existingEmail = prefs.getString(_keyUserEmail);
      if (existingEmail == email) {
        return false;
      }

      // Save user data
      await prefs.setString(_keyUserName, name);
      await prefs.setString(_keyUserEmail, email);
      await prefs.setString(_keyUserPassword, password);
      await prefs.setBool(_keyLoggedIn, true);

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? savedEmail = prefs.getString(_keyUserEmail);
      String? savedPassword = prefs.getString(_keyUserPassword);

      if (savedEmail == email && savedPassword == password) {
        await prefs.setBool(_keyLoggedIn, true);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserName);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserEmail);
  }

  static Future<bool> resetPassword(String email, String newPassword) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedEmail = prefs.getString(_keyUserEmail);

      if (savedEmail == email) {
        await prefs.setString(_keyUserPassword, newPassword);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, false);
  }
}