import 'package:flutter/material.dart';

class ReusableScaffold extends StatelessWidget {
  final Widget child;

  const ReusableScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: SizedBox.expand(
              child: Image.asset(
                "assets/images/pattern.png",
                fit: BoxFit.cover,
                color: const Color.fromARGB(255, 26, 92, 45),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height, child: child),
        ],
      ),
    );
  }
}
