import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String completePhoneNumber = '';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      _showErrorDialog('Passwords do not match.');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      String errorMessage = e.message ?? 'Unknown error occurred';
      _showErrorDialog(errorMessage);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Let's save the environment together",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 50),

              // Name
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Your Name',
                  labelText: 'Name',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Phone with country code
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                initialCountryCode: 'BD',
                onChanged: (phone) {
                  completePhoneNumber = phone.completeNumber;
                },
              ),
              const SizedBox(height: 5),

              // Email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'user@example.com',
                  labelText: 'Email',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Password
              TextField(
                controller: passwordController,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  hintText: '***********',
                  labelText: 'Password',
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Confirm Password
              TextField(
                controller: confirmPasswordController,
                obscureText: !confirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: '***********',
                  labelText: 'Confirm Password',
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      confirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: _signUp,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              const Center(
                child: Text(
                  'Or Sign Up with',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 1),

              const SizedBox(height: 50),

              // Already have account
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'M360 ICT',
                        style: TextStyle(fontSize: 13, color: Colors.green),
                      ),
                    ],
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
