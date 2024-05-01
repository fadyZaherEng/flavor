import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flavor/flavors.dart';
import 'package:flavor/home_screen.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Token: ${}")
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(
        title: F.getBodyTitle,
      ),
    );
  }
}
