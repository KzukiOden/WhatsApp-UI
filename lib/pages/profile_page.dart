import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whats_app_series/pages/main_interface.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class ProfilePage extends StatefulWidget {
  TextEditingController nameOfUser = TextEditingController();
  File? pickImage;

  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /*
  For Picking Image & used async we exceute 2 or more lines at a time
  i-e exceute line 2 & line 100 at same time
  */
  _imagePick(ImageSource imagePic) async {
    try {
      final photo = await ImagePicker().pickImage(source: imagePic);
      if (photo == null) return;
      final tempPhoto = File(photo.path);
      setState(() {
        widget.pickImage = tempPhoto;
      });
    } catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Color(0xff00A884),
        ),
      );
    }
  }

  // if we user _ in a ftn it means it's private function
  _pickPicture(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _imagePick(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {
                      _imagePick(ImageSource.gallery);
                    },
                    icon: Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Must Enter the name in the TextFile
  verifyName(String userName) {
    if (userName.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enter UserName'),
          backgroundColor: Color(0xff00A884),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainInterface()),
      );
    }
  }

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
      body: SingleChildScrollView(
        child: Column(children: [_picText(), _addPic(), _fieldForText()]),
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          verifyName(widget.nameOfUser.text.toString());
        },
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
      child: GestureDetector(
        onTap: () {
          _pickPicture(context);
        },
        child: CircleAvatar(
          backgroundColor: const Color(0xffD9D9D9),
          radius: 65,
          child:
              widget.pickImage == null
                  ? ClipOval(
                    child: Image.asset(
                      'assets/images/camera.png',
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                    ),
                  )
                  : ClipOval(
                    child: Image.file(
                      widget.pickImage!,
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _fieldForText() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: TextField(
        controller: widget.nameOfUser,
        decoration: InputDecoration(
          hintText: 'Type your name here',
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff05AA82)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff05AA82)),
          ),
        ),
      ),
    );
  }
}
