import 'package:basic_animation/custom-painter/bouncing_ball_page.dart';
import 'package:basic_animation/explicit/list_animation.dart';
import 'package:basic_animation/explicit/loading_aniamtion.dart';
import 'package:basic_animation/explicit/login_animation.dart';
import 'package:basic_animation/implicit/animated_color_pallete.dart';
import 'package:basic_animation/implicit/animated_shopping_cart.dart';
import 'package:basic_animation/implicit/circle_pulsating.dart';
import 'package:basic_animation/page_route/page_route_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BouncingBallPage(),
    );
  }
}
