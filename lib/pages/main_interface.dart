import 'package:flutter/material.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class MainInterface extends StatefulWidget {
  const MainInterface({super.key});

  @override
  State<MainInterface> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
