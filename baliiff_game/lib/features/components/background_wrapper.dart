import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  final String backgroundImage;

  const BackgroundWrapper({
    super.key,
    required this.child,
    this.backgroundImage = 'assets/bg.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

