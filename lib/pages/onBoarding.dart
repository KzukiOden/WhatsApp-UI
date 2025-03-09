import 'package:flutter/material.dart';
import 'package:whats_app_series/pages/login.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/QR.png'),
            SizedBox(height: 20),
            UiHelper.customText(
              text: 'Welcome to WhatsApp',
              height: 20,
              color: Color(0xff000000),
            ),
            SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: 'Read out ',
                style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontSize: 14,
                  fontFamily: 'Regular',
                ),
                children: [
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(
                      color: Color(0xff0C42CC),
                      fontSize: 14,
                      fontFamily: 'Regular',
                    ),
                  ),

                  TextSpan(
                    text: ' Tap “Agree and continue”',
                    style: TextStyle(
                      color: Color(0xff5E5E5E),
                      fontSize: 14,
                      fontFamily: 'Regular',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            RichText(
              text: TextSpan(
                text: 'to accept the',
                style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontSize: 13,
                  fontFamily: 'Regular',
                ),
                children: [
                  TextSpan(
                    text: ' Teams of Service.',
                    style: TextStyle(
                      color: Color(0xff0C42CC),
                      fontSize: 13,
                      fontFamily: 'Regular',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => LoginScreen(),
            ),
          );
        },
        buttonname: 'Agree and continue',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
