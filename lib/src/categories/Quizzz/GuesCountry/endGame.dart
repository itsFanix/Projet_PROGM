
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class endGame extends StatelessWidget{

  final String score;


const endGame({super.key, required this.score});

  @override
  Widget build(BuildContext context) {

var bestScore =0;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple.shade900,
         appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => "",
          ),
         
        ),
        
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
          child: bodyBuildEnd(bestScore, context)),

      ));
    
  
    
  }

  Center bodyBuildEnd(int bestScore, BuildContext context) {
    return Center(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text("score: $score", style :TextStyle(fontWeight:  FontWeight.bold, fontSize: 20, color: Colors.white)),
             ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text('best Score $bestScore',style :TextStyle(fontWeight:  FontWeight.bold, fontSize: 20, color: Colors.white)),
             ),

             Padding(
               padding: const EdgeInsets.all(10.0),
               child: ElevatedButton(onPressed: () => context.go("/GuesCountry"), child: const Text("PlayAgain")),
             )
      
        ]),
      );
  }
}