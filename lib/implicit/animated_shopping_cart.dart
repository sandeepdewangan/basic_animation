import 'package:flutter/material.dart';

class AnimatedShoppingCart extends StatefulWidget {
  const AnimatedShoppingCart({super.key});

  @override
  State<AnimatedShoppingCart> createState() => _AnimatedShoppingCartState();
}

class _AnimatedShoppingCartState extends State<AnimatedShoppingCart> {
  bool isExpanded = false;

  void onAddToCart() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Color Pallete")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onAddToCart,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: isExpanded ? 150 : 60,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isExpanded ? 20 : 5),
                  color: isExpanded ? Colors.blue : Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(
                      isExpanded ? Icons.done : Icons.shopping_basket,
                      color: Colors.white,
                      size: 25,
                    ),
                    if (isExpanded)
                      Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
