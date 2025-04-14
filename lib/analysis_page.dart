import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: Colors.white,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button + Home logo + Home text
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Image.asset(
                      'assets/home_logo.png', // green home logo
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // Right image
                Padding(
                  padding: const EdgeInsets.only(top: 8.0), // Adjust the value
                  child: Image.asset(
                    'assets/top_right_icon.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2 images side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/image1.png',
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Image.asset(
                    'assets/image2.png',
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // History text before image3
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Full width image
            Image.asset(
              'assets/image3.png',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),

            // Another 2 images side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/image4.png',
                    width: 90,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Image.asset(
                    'assets/image5.png',
                    width: 90,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Final full width image
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Adjust the radius
              child: Image.asset(
                'assets/image6.png',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
