import 'dart:io';

import 'package:aapdevloper/login/logindart.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  bool isIconeyes = false;
  final namecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

  Future<void> register() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', namecontroller.text);
    await prefs.setString('pass', passcontroller.text);
    await prefs.setString('email', emailcontroller.text);
    if (_selectedImage != null) {
      await prefs.setString('profileImage', _selectedImage!.path);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/Tea.jpg'),fit: BoxFit.cover)
      ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Registration',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _selectedImage != null
                          ? FileImage(File(_selectedImage!.path))
                          : const AssetImage('assets/profile.jpg'),
                      child: _selectedImage == null
                          ? const Icon(Icons.add_a_photo, size: 30, color: Colors.white)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: 'Name...',
                      suffixIcon: const Icon(Icons.account_box_outlined),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your Email Address...',
                      prefixIcon: const Icon(Icons.account_circle),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passcontroller,
                    obscureText: !isIconeyes,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isIconeyes = !isIconeyes;
                          });
                        },
                        child: Icon(
                          isIconeyes ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: () => register(),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
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