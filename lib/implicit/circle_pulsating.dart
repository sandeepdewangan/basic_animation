import 'package:flutter/material.dart';

class CirclePulsating extends StatefulWidget {
  const CirclePulsating({super.key});

  @override
  State<CirclePulsating> createState() => _CirclePulsatingState();
}

class _CirclePulsatingState extends State<CirclePulsating> {
  bool isClicked = false;

  @override
  void initState() {
    super.initState();

    isClicked = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Color Pallete")),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 200.0),
          duration: const Duration(milliseconds: 1500),
          builder: (context, size, widget) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.5),
                    offset: Offset(0, 0),
                    spreadRadius: size / 2,
                    blurRadius: size,
                  ),
                  BoxShadow(color: Colors.greenAccent),
                ],
              ),
              child:
                  widget, // Text is the child widget and will not be rebuild again and again.
            );
          },
          child: Text("A Circle"),
        ),
      ),
    );
  }
}
