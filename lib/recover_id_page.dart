import 'package:flutter/material.dart';
import 'verify_otp_page.dart'; 

class RecoverIdPage extends StatelessWidget {
  const RecoverIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recover ID',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your registered email to receive an OTP",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 120),

            // Email Input
            const TextField(
              decoration: InputDecoration(
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
            const SizedBox(height: 20),

            // Send OTP Button 
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  // Navigate to Verify OTP page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VerifyOtpPage()),
                  );
                },
                child: const Text(
                  'Send OTP',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 50),

            // Footer Text 
            const Spacer(),
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
