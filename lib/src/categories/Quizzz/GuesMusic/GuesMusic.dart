


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuesMusic extends StatefulWidget{
  @override
  State<GuesMusic> createState() => _GuesMusicState();
}







class _GuesMusicState extends State<GuesMusic> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.go("/categories"),
        
        ),
        title: const Text("hellpo"),
      ),
      //create a Grid of two row and 6 columns
      body: Container(
         decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.purple.shade800,
                  Colors.purple.shade700,
                  Colors.purple.shade600,
                  Colors.purple.shade500,
                  Colors.purple.shade400,
                ])),

    )
    );
  }
}