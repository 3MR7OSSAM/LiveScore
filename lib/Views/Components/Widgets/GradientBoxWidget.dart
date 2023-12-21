import 'package:flutter/material.dart';

class GradientBoxWidget extends StatelessWidget {
  const GradientBoxWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(stops: [0,0.98], begin: Alignment.topLeft, end: Alignment.bottomLeft, colors: [Color(0xFF242222),Color(0xFF4E4E4F)]),
        ),
        child: child,
      ),
    );
  }
}
