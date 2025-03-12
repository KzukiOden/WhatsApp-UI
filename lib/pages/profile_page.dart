import 'package:flutter/material.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: UiHelper.customText(
            text: 'Profile info',
            height: 19,
            color: Color(0xff00A884),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(children: [_picText(), _addPic(), _fieldForText()]),
      floatingActionButton: UiHelper.customButton(
        callback: () {},
        buttonname: 'Next',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _picText() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'Please provide your name and an optional',
                style: TextStyle(color: Color(0xff5E5E5E)),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'profile photo',
                style: TextStyle(color: Color(0xff5E5E5E)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addPic() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CircleAvatar(
        backgroundColor: Color(0xffD9D9D9),
        radius: 65,
        child: ClipOval(child: Image.asset('assets/images/camera.png')),
      ),
    );
  }

  Widget _fieldForText() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Type your name here',
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff05AA82)),
          ),
        ),
      ),
    );
  }
}
