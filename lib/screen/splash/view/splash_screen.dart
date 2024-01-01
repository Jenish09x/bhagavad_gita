
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5),() => Navigator.pushReplacementNamed(context, 'home'));
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/image/Krishna.jpeg",
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Align(alignment: const Alignment(0,-0.6),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'भागवद गीता',
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 300), colors: [Colors.pinkAccent.shade400,Colors.white,Colors.black],
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 500),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
