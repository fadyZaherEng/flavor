import 'package:flavor/flavors.dart';
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
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              F.getIcon,
              width: 50,
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
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
    );
  }
}
