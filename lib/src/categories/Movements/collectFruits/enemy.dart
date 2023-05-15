
import "package:flutter/material.dart";


class notFruit extends StatelessWidget{

  final double ballX;
  final double ballY;

  const notFruit({super.key, required this.ballX, required this.ballY});
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment(ballX,ballY),
      child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    
      ),
    );
  }


  
}