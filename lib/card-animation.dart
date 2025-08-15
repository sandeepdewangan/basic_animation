// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;

  late Animation<Offset> titleSlideAnimation;
  late Animation<double> cardScaleAnimation;
  late List<Animation<double>> numberAnimation;
  late List<Animation<Offset>> cardSlideDownAnimation;

  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    numberAnimation = List.generate(4, (index) {
      return Tween<double>(
        begin: 0,
        end: Random().nextDouble(),
      ).animate(controller2);
    });

    titleSlideAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutSine));

    cardScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    cardSlideDownAnimation = List.generate(4, (index) {
      return Tween<Offset>(
        begin: Offset(0, -index.toDouble()),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: controller2, curve: Curves.decelerate),
      );
    });

    cardScaleAnimation.addStatusListener((status) {
      if (status.isCompleted) {
        // start another slide animation for rest of the cards
        setState(() {
          isVisible = true;
          controller2.forward();
        });
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = (MediaQuery.of(context).size.width - 110) / 6;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
              position: titleSlideAnimation,
              child: ListTile(
                title: Text(
                  "Hello, Sandeep",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Let's check how you fell today",
                ),
                trailing: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Todays Goal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text("Today's goal"),
                  isVisible
                      ? const SizedBox.shrink()
                      : ScaleTransition(
                          scale: cardScaleAnimation,
                          child: BlankFitnessContainer(),
                        ),
                  Visibility(
                    visible: isVisible,
                    child: SlideTransition(
                      position: cardSlideDownAnimation[0],
                      child: AnimatedBuilder(
                        animation: numberAnimation[0],
                        builder: (context, child) {
                          return FitnessContainer(
                            screenWidth: screenWidth,
                            backgroundColor: Colors.amber,
                            featureIcon: Icons.favorite_border_outlined,
                            featureText: 'Heart rate',
                            featureDeviationText: '20% lower 🔻',
                            featureRange: '65/82 bpm',
                            featurePercentage:
                                '${(numberAnimation[0].value * 100).toStringAsFixed(0)}%',
                          );
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: SlideTransition(
                      position: cardSlideDownAnimation[1],
                      child: AnimatedBuilder(
                        animation: numberAnimation[1],
                        builder: (context, child) {
                          return FitnessContainer(
                            screenWidth: screenWidth,
                            backgroundColor: const Color.fromARGB(
                              255,
                              143,
                              202,
                              230,
                            ),
                            featureIcon: Icons.alarm_add_outlined,
                            featureText: 'Active time',
                            featureDeviationText: '4% higher 🔺',
                            featureRange: '142/120 min',
                            featurePercentage:
                                '${(numberAnimation[1].value * 100).toStringAsFixed(0)}%',
                          );
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: SlideTransition(
                      position: cardSlideDownAnimation[2],
                      child: AnimatedBuilder(
                        animation: numberAnimation[2],
                        builder: (context, child) {
                          return FitnessContainer(
                            screenWidth: screenWidth,
                            backgroundColor: const Color.fromARGB(
                              255,
                              211,
                              175,
                              244,
                            ),
                            featureIcon: Icons.start,
                            featureText: 'Calories',
                            featureDeviationText: '10% lower 🔻',
                            featureRange: '1800/2000 kcal',
                            featurePercentage:
                                '${(numberAnimation[2].value * 100).toStringAsFixed(0)}%',
                          );
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: SlideTransition(
                      position: cardSlideDownAnimation[3],
                      child: AnimatedBuilder(
                        animation: numberAnimation[3],
                        builder: (context, child) {
                          return FitnessContainer(
                            screenWidth: screenWidth,
                            backgroundColor: const Color.fromARGB(
                              255,
                              161,
                              247,
                              190,
                            ),
                            featureIcon: Icons.run_circle_outlined,
                            featureText: 'Steps',
                            featureDeviationText: '15% lower 🔻',
                            featureRange: '5,000/10,000 steps',
                            featurePercentage:
                                '${(numberAnimation[3].value * 100).toStringAsFixed(0)}%',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FitnessContainer extends StatelessWidget {
  final double screenWidth;
  final Color backgroundColor;
  final IconData featureIcon;
  final String featureText;
  final String featureDeviationText;
  final String featureRange;
  final String featurePercentage;

  const FitnessContainer({
    super.key,
    required this.screenWidth,
    required this.backgroundColor,
    required this.featureIcon,
    required this.featureText,
    required this.featureDeviationText,
    required this.featureRange,
    required this.featurePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Column(
        children: [
          // Row 1 - Hear Rate and percentage lower
          Row(
            spacing: 5,
            children: [
              Icon(
                featureIcon,
                color: Colors.black,
              ),
              Text(
                featureText,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                featureDeviationText,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Row 2 - Percentage Description
          Row(
            children: [
              Text(
                featureRange,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                featurePercentage,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // Percentage bar
          Row(
            spacing: 5,
            children: [
              SingleProgressBar(screenWidth: screenWidth),
              SingleProgressBar(screenWidth: screenWidth),
              SingleProgressBar(screenWidth: screenWidth),
              SingleProgressBar(screenWidth: screenWidth),
              SingleProgressBar(
                screenWidth: screenWidth,
                color: const Color.fromARGB(111, 164, 164, 164),
              ),
              SingleProgressBar(
                screenWidth: screenWidth,
                color: const Color.fromARGB(111, 164, 164, 164),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SingleProgressBar extends StatelessWidget {
  const SingleProgressBar({
    super.key,
    required this.screenWidth,
    this.color = Colors.black,
  });

  final double screenWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        border: BoxBorder.fromLTRB(
          top: BorderSide(
            color: color,
            width: 5,
          ),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class BlankFitnessContainer extends StatelessWidget {
  const BlankFitnessContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 64, 63, 63),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Column(
        children: [
          // Row 1 - Hear Rate and percentage lower
          Row(
            spacing: 5,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Row 2 - Percentage Description
          Row(
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                '',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // Percentage bar
          Row(
            spacing: 5,
            children: [
              // SingleProgressBar(screenWidth: 10),
            ],
          ),
        ],
      ),
    );
  }
}
