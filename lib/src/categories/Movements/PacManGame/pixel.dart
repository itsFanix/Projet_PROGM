import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  final child;
  final innerColor;
  final outerColor;

  const MySquare({super.key, this.innerColor, this.outerColor, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(2),
            color: outerColor,
            child:  ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            // padding: const EdgeInsets.all(2),
            color: innerColor,
            child: Center(child: child),
          ),
        ),
          ),
        )
        );
  }
}
