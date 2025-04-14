import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'recover_id_page.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool rememberMe = false;
  bool _isPasswordVisible = false;
  bool _isPasswordFocused = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signInWithEmailPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),  // Trimming the email
        password: _passwordController.text.trim(),  // Trimming the password
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign In Failed: ${e.toString()}')),
      );
    }
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
              const Text('Sign In', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Let's save the environment together", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 120),

              // Email
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'user@example.com',
                  labelText: 'Email',
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '***********',
                  labelText: 'Password',
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                  suffixIcon: _isPasswordFocused
                      ? IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
              const SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  const Text('Remember me'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RecoverIdPage()),
                      );
                    },
                    child: const Text(
                      'Forgotten Password',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: _signInWithEmailPassword,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              const Center(child: Text('Or Sign in with', style: TextStyle(color: Colors.grey))),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/google.png', width: 32, height: 32),
                  const SizedBox(width: 20),
                  Image.asset('assets/facebook.png', width: 59, height: 59),
                  const SizedBox(width: 20),
                  Image.asset('assets/microsoft.png', width: 42, height: 42),
                  const SizedBox(width: 20),
                  Image.asset('assets/apple.png', width: 62, height: 62),
                ],
              ),
              const SizedBox(height: 50),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have an account? ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Powered by ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      TextSpan(text: 'M360 ICT', style: TextStyle(fontSize: 13, color: Colors.green)),
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
