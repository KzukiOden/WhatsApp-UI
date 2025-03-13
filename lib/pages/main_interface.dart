import 'package:flutter/material.dart';
import 'package:whats_app_series/components/calls.dart';
import 'package:whats_app_series/components/camera.dart';
import 'package:whats_app_series/components/chats.dart';
import 'package:whats_app_series/components/status.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class MainInterface extends StatefulWidget {
  const MainInterface({super.key});

  @override
  State<MainInterface> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // For creating sections i-e chats, status, calls
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt, color: Colors.white)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
            indicatorColor: Colors.white,
          ),
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: UiHelper.customText(
            text: 'WhatsApp',
            height: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        body: TabBarView(children: [Camera(), Chats(), Status(), Calls()]),
      ),
    );
  }
}
