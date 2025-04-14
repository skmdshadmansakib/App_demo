import 'package:flutter/material.dart';
import 'sign_in_page.dart';  

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ResetPasswordPageState createState() => ResetPasswordPageState(); 
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  // Variables to toggle password visibility
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isPasswordFocused = false;
  bool _isConfirmPasswordFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a new password for your account',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 100),

            // New Password TextField
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: '************',
                labelText: 'New Password',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                suffixIcon: _isPasswordFocused
                    ? IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )
                    : null,
              ),
              onTap: () {
                setState(() {
                  _isPasswordFocused = true;
                });
              },
              onEditingComplete: () {
                setState(() {
                  _isPasswordFocused = false;
                });
              },
            ),
            const SizedBox(height: 20),

            // Confirm Password TextField
            TextField(
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                hintText: '************',
                labelText: 'Confirm Password',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                suffixIcon: _isConfirmPasswordFocused
                    ? IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      )
                    : null,
              ),
              onTap: () {
                setState(() {
                  _isConfirmPasswordFocused = true;
                });
              },
              onEditingComplete: () {
                setState(() {
                  _isConfirmPasswordFocused = false;
                });
              },
            ),
            const SizedBox(height: 50),

            // Reset Password Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  // Navigate to SignInPage after resetting the password
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
                child: const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const Spacer(),

            // Footer
            const Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Powered by ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'M360 ICT',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
