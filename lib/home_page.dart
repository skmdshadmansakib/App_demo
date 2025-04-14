import 'package:flutter/material.dart';
import 'office_page.dart';
import 'analysis_page.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/header_image.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'My Places',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ✅ Make home_image.png clickable
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnalysisPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/home_image.png',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Office Image
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Image.asset(
                      'assets/office_image.png',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),

            // Floating "+" Button
            Positioned(
              bottom: 30,
              right: 30,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OfficePage(),
                    ),
                  );
                },
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
