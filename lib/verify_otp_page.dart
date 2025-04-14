import 'package:flutter/material.dart';
import 'reset_password_page.dart'; 

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Recover your account in easy step',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 100),

            // Rich text with email info and instruction
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 14),
                children: [
                  TextSpan(
                    text: 'An email has been sent ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'user@example.com\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Please enter the sent OTP.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // OTP Boxes aligned under the text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '|', // Replace this with controller input later
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              }),
            ),

            const SizedBox(height: 150),

            // Verify OTP Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  // Navigate to Reset Password page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetPasswordPage()),
                  );
                },
                child: const Text(
                  'Verify OTP',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Resend Section
            Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Didn't receive a code? ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
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
