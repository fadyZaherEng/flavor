import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flavor/flavors.dart';
import 'package:flavor/home_screen.dart';
import 'package:flutter/material.dart';

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
  void didChangeDependencies() async {
    super.initState();
   try{
     final token = await FirebaseMessaging.instance.getToken();
     print(token);
   }catch(e){
   }
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
