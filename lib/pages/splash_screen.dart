import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whats_app_series/pages/onBoarding.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  // parent class
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Auto Matic Parent Class is called
    super.initState();
    // Timer for splash screen
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/whatsapp_icon.png'),
            SizedBox(height: 20),
            UiHelper.customText(
              text: 'WhatsApp',
              height: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
