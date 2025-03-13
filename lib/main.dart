import 'package:flutter/material.dart';
import 'package:whats_app_series/pages/main_interface.dart';
import 'package:whats_app_series/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff008069)),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff008069)),
      ),
      home: const MainInterface(),
    );
  }
}
