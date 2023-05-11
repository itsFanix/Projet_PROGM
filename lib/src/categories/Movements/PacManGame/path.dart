import 'package:flutter/material.dart';

class MyPath extends StatelessWidget {
  final child;
  final innerColor;
  final outerColor;

  const MyPath({super.key, this.innerColor, this.outerColor, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Container(
            // padding: const EdgeInsets.all(),
            color: outerColor,
            child:  ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
          
            // color: innerColor,
            child: Center(child: child),
          ),
        ),
          ),
        )
        );
  }
}
