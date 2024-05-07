// ignore_for_file: camel_case_types

import 'package:flavor/flavors.dart';
import 'package:flavor/src/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  final String title;

  const homeScreen({
    super.key,
    required this.title,
  });

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                F.getIcon,
                width: 50,
                height: 50,
                matchTextDirection: true,
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: F.getBodyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
