
import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget{
  const MyPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(1.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child:  Icon(  Icons.android, size: 30, color: Colors.greenAccent,),
      ),
    );
    
  }


}