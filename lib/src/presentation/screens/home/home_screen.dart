// ignore_for_file: camel_case_types

import 'package:flavor/flavors.dart';
import 'package:flavor/src/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          F.getTitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: F.getBodyColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
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
                  F.getBodyTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: F.getBodyColor,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: F.getBodyColor,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
