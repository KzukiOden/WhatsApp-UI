import 'package:flutter/material.dart';
import 'package:whats_app_series/pages/profile_page.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

// To send 1 page Data on the second page we use bunddle passing

class VerifyPage extends StatefulWidget {
  String phonenumber;
  final TextEditingController opt1Controller;
  final TextEditingController opt2Controller;
  final TextEditingController opt3Controller;
  final TextEditingController opt4Controller;
  final TextEditingController opt5Controller;
  final TextEditingController opt6Controller;
  VerifyPage({
    super.key,
    required this.phonenumber,
    required this.opt1Controller,
    required this.opt2Controller,
    required this.opt3Controller,
    required this.opt4Controller,
    required this.opt5Controller,
    required this.opt6Controller,
  });

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: UiHelper.customText(
            text: 'Verifying your number',
            height: 21,
            color: Color(0xff00A884),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          _loginInfo(),
          SizedBox(height: 25),
          _optBox(),
          SizedBox(height: 50),
          UiHelper.customText(
            text: 'Didn’t receive code?',
            height: 14,
            color: Color(0xff00A884),
          ),
        ],
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        },
        buttonname: 'Next',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _loginInfo() {
    return Column(
      children: [
        Center(
          child: UiHelper.customText(
            text: "You’ve tried to register +92${widget.phonenumber}",
            height: 14,
            color: Color(0xff5E5E5E),
          ),
        ),
        UiHelper.customText(
          text: 'recently. Wait before requesting an sms or a call',
          height: 14,
        ),
        SizedBox(height: 4),
        /* GesterDetector convets a Widget into a Button, 
        In this RichText was converted into a button 
        such that if person has given wrong number it can go 
        backward to the enterNumber section */
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: RichText(
            text: TextSpan(
              text: 'with your code. ',
              style: TextStyle(color: Color(0xff5E5E5E), fontSize: 14),
              children: [
                TextSpan(
                  text: 'Wrong number?',
                  style: TextStyle(fontSize: 14, color: Color(0xff00A884)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _optBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UiHelper.optContainers(widget.opt1Controller),
        UiHelper.optContainers(widget.opt2Controller),
        UiHelper.optContainers(widget.opt3Controller),
        UiHelper.optContainers(widget.opt4Controller),
        UiHelper.optContainers(widget.opt5Controller),
        UiHelper.optContainers(widget.opt6Controller),
      ],
    );
  }
}
