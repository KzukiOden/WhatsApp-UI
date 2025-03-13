import 'package:flutter/material.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class Chats extends StatelessWidget {
  Chats({super.key});

  var arrContent = [
    {
      "image": 'assets/images/profile/pic1.jpg',
      "name": 'John Doe',
      "Time": '10:30 AM',
      "msg": '5',
      "lastMessage": 'Hey! How are you?',
    },
    {
      "image": 'assets/images/profile/pic2.jpg',
      "name": 'Emma Smith',
      "Time": '9:15 AM',
      "msg": '6',
      "lastMessage": 'Let’s catch up later!',
    },
    {
      "image": 'assets/images/profile/pic3.jpg',
      "name": 'Michael Brown',
      "Time": 'Yesterday',
      "msg": '8',
      "lastMessage": 'Got the files. Thanks!',
    },
    {
      "image": 'assets/images/profile/pic4.jpg',
      "name": 'Sophia Johnson',
      "Time": '8:45 AM',
      "msg": '7',
      "lastMessage": 'Can we reschedule?',
    },
    {
      "image": 'assets/images/profile/pic5.jpg',
      "name": 'Liam Williams',
      "Time": 'Monday',
      "msg": '9',
      "lastMessage": 'Meeting at 3 PM.',
    },
    {
      "image": 'assets/images/profile/pic6.jpg',
      "name": 'Olivia Davis',
      "Time": '11:20 AM',
      "msg": '5',
      "lastMessage": 'I’ll be there soon!',
    },
    {
      "image": 'assets/images/profile/pic7.jpg',
      "name": 'Noah Wilson',
      "Time": 'Sunday',
      "msg": '6',
      "lastMessage": 'Good morning!',
    },
    {
      "image": 'assets/images/profile/pic8.jpg',
      "name": 'Ava Martinez',
      "Time": 'Yesterday',
      "msg": '10',
      "lastMessage": 'See you tomorrow!',
    },
    {
      "image": 'assets/images/profile/pic9.jpg',
      "name": 'William Anderson',
      "Time": '5:00 PM',
      "msg": '7',
      "lastMessage": 'Let’s discuss the project.',
    },
    {
      "image": 'assets/images/profile/pic10.jpg',
      "name": 'Mia Thomas',
      "Time": '6:45 PM',
      "msg": '8',
      "lastMessage": 'Happy Birthday!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: arrContent.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                arrContent[index]['image'].toString(),
              ),
            ),
            title: UiHelper.customText(
              text: arrContent[index]['name'].toString(),
              height: 14,
              fontWeight: FontWeight.bold,
            ),
            subtitle: UiHelper.customText(
              text: arrContent[index]['lastMessage'].toString(),
              height: 13,
              color: Color(0xff889095),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Ensure alignment
              children: [
                UiHelper.customText(
                  text: arrContent[index]['Time'].toString(),
                  height: 12,
                  color: Color(0xff026500),
                ),
                SizedBox(height: 5), // Add spacing
                SizedBox(
                  width: 20, // Set fixed width for alignment
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xff026500),
                    child: UiHelper.customText(
                      text: arrContent[index]['msg'].toString(),
                      height: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff008665),
        shape: CircleBorder(),
        child: Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
