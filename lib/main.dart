import 'dart:async';
import 'package:flavor/flavors.dart';
import 'package:flavor/home_screen.dart';
import 'package:flutter/material.dart';
import 'app.dart';

FutureOr<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(
        title:F.getBodyTitle,
      ),
    );
  }
}
