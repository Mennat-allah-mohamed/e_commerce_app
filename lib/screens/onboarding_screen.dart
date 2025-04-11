// screens/onboarding_screen.dart
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 150, // Adjust as needed
            top:110,  // Adjust as needed
            child: Image.asset('assets/electric.png', height: 200),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  // Stack for overlapping text and electric icon

                      const Text(
                        "CYBER \n LINIO",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                  SizedBox(height: 20),
                  const Text(
                    "40% DSCNT \n in technology",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "FREE SHIPPING",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Stack for overlapping product images
                  SizedBox(height: 20),
                  SizedBox(
                    height: 280, // Adjust based on your needs
                    child: Stack(
                      children: [
                        // Position each image with different offsets
                        Positioned(
                          left:10,
                          top: 10,
                          child: Image.asset('assets/MacBook.png', height: 150),
                        ),
                        Positioned(
                          left: 220,
                          top: 0,
                          child: Image.asset('assets/headphone.png', height:170),
                        ),
                        Positioned(
                          left: 30,
                          top: 100,
                          child: Image.asset('assets/game.png', height: 100 , width: 100,),
                        ),
                        Positioned(
                          left: 0,
                          top: 200,
                          child: Image.asset('assets/icon.png', height: 70),
                        ),
                        Positioned(
                          left: 150,
                          top: 160,
                          child: Image.asset('assets/remote.png', height: 80),
                        ),
                        Positioned(
                          left:200,
                          top: 0,
                          child: Image.asset('assets/airpods.png', height: 50),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text("LOG IN"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main');
                    },
                    child: Center(
                      child: const Text(
                        "SKIP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}