import 'package:flutter/material.dart';

class LoadingAniamtion extends StatefulWidget {
  const LoadingAniamtion({super.key});

  @override
  State<LoadingAniamtion> createState() => _LoadingAniamtionState();
}

class _LoadingAniamtionState extends State<LoadingAniamtion>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween<double>(begin: 0, end: 0.9).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: animation.value,
                    color: Colors.blue,
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  animation.value.toStringAsFixed(2),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
