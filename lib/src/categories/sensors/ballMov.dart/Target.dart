
import 'package:flutter/material.dart';

class Target extends StatelessWidget{

  final double targetX;
  final double targetY;
  final color;

  const Target({super.key, required this.targetX, required this.targetY, this.color});
  @override
  Widget build(BuildContext context) {
   
    return Container(
      alignment: Alignment(targetX,targetY),
      child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    
      ),
    );
  }


}