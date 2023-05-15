

import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget{

  final playerX;

  const MyPlayer({super.key, this.playerX});
  

  @override
  Widget build(BuildContext context) {
   return  Container(
     alignment: Alignment(playerX, 1),
     child: ClipRRect(
       child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/images/catTwo.jpg'), fit: BoxFit.cover)
        ),
        //  color: Colors.pink,
         height: 60,
         width: 60,
       ),
     ),
   );
  }

}