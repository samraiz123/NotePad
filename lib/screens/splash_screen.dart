import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_green/screens/myhome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A148C), Color(0xFF7B1FA2), Color(0xFFBA68C8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.sticky_note_2_rounded,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              AnimatedTextKit(
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
                animatedTexts: [
                  FadeAnimatedText(
                    'Welcome to',
                    textStyle: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                      color: Colors.white70,
                    ),
                    duration: const Duration(milliseconds: 1100),
                  ),
                  RotateAnimatedText(
                    'Note Keeper',
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 18.0,
                          color: Colors.deepPurpleAccent,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 1200),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Think green. Write clean.',
                style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
