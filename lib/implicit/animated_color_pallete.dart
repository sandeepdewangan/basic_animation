import 'dart:math';

import 'package:basic_animation/widgets/simple_button.dart';
import 'package:flutter/material.dart';

class AnimatedColorPallete extends StatefulWidget {
  const AnimatedColorPallete({super.key});

  @override
  State<AnimatedColorPallete> createState() => _AnimatedColorPalleteState();
}

class _AnimatedColorPalleteState extends State<AnimatedColorPallete> {
  List<Color> colors = generateRandomColor();

  static List<Color> generateRandomColor() {
    final random = Random();
    return List.generate(5, (_) {
      return Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  void onAnimate() {
    setState(() {
      colors = generateRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Color Pallete")),
      body: Center(
        child: Column(
          children: [
            for (final color in colors)
              AnimatedContainer(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
                width: 100,
                height: 100,
                color: color,
                margin: const EdgeInsets.all(10),
              ),
            SimpleButton(title: "Animate", onPressed: onAnimate),
          ],
        ),
      ),
    );
  }
}
