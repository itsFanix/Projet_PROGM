import 'package:flutter/material.dart';

class MyFruit extends StatefulWidget{
  final double fruitX;
  final double fruitY;

  const MyFruit({super.key, required this.fruitX, required this.fruitY});

  @override
  State<MyFruit> createState() => _MyFruitState();
}

class _MyFruitState extends State<MyFruit> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment(widget.fruitX,widget.fruitY),
      child: Container(
          width: 30,
          height: 50,
          decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/strawberry.png'), fit: BoxFit.cover)
          
          ),
    
      ),
    );
  }
}