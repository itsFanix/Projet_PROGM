
import 'package:flutter/material.dart';

class Player extends StatelessWidget{
  final double posX;
  final double posY;
  const Player({super.key, required this.posX, required this.posY});

 final double ballSize = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:  Alignment(posX, posY),
      child: Transform.translate(
                     offset: Offset(posX, posY),
                     child:  CircleAvatar(
                       radius: ballSize,
                       backgroundColor: Colors.red,
                     ),
                   ),
    );
  }

}