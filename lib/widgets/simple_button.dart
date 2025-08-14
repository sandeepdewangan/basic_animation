import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SimpleButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.deepOrange,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
