import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<resetpassword> {
  bool _isPasswordVisible = false;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  final _emailController = TextEditingController();
  final _newPassController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _newPassController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final enteredEmail = _emailController.text.trim();
    final newPassword = _newPassController.text.trim();

    setState(() {
      _isEmailValid = storedEmail != null && storedEmail == enteredEmail;
      _isPasswordValid = newPassword.isNotEmpty;
    });

    if (_isEmailValid && _isPasswordValid) {
      await prefs.setString('pass', newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset successful'),
          duration: Duration(seconds: 4),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Tea.jpg'),fit: BoxFit.cover)
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter registered email',
                    prefixIcon: const Icon(Icons.account_circle),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _isEmailValid ? Colors.black87 : Colors.red,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    errorText: _isEmailValid ? null : 'Enter the email used to login',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _newPassController,
                  obscureText: !_isPasswordVisible,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _isPasswordValid ? Colors.black87 : Colors.red,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    errorText: _isPasswordValid ? null : 'Password cannot be empty',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}