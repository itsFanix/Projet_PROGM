import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_progm/src/categories/movements/collectFruits/Basket.dart';
import 'package:projet_progm/src/categories/movements/collectFruits/Fruit.dart';

class CollectFruits extends StatefulWidget {
  const CollectFruits({super.key});

  @override
  State<CollectFruits> createState() => _CollectFruitsState();
}

class _CollectFruitsState extends State<CollectFruits> {
  int score = 0;
  static double  basketX = 0;
  int bestscore= 0;
  double fruitX= Random().nextDouble() * 2 - 1;
  double fruitY= -1;
  bool start=false;

  final player=  AudioPlayer();


  void dropFruit(timer){
    if(fruitY +0.005<1){
      fruitY +=0.005;
    }
    else  {
       print("drop");
       timer.cancel();
       _showDialog();
       player.stop();
       

    }

    
  }

  void _showDialog(){
  showDialog(context: context,
   builder: (BuildContext context){
    return  AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: const Text("Loose ☹", style: TextStyle(color: Colors.white),),
      content: Text("score : $score", style: const TextStyle(color: Colors.white, fontSize: 25)),
      actions: [
       TextButton(
              onPressed: () => resetGame(),
              child: const Text('R E S T A R T'),
            ),
      ],
    );
   }
   
   );
 
}

void resetGame(){
  setState(() {
    Navigator.pop(context); //dismiss
    score=0;
    start=false;
    fruitX= Random().nextDouble() * 2 - 1;
    fruitY=-1;
  });

}

  void startGame() {

    start =true;
    player.play(AssetSource('audios/gameSong.mp3'));
    Timer.periodic(const Duration(milliseconds: 5), (timer) {

      setState(() {
        dropFruit(timer); 
      });

      if(collision()){
       addFruit();
      }
      
    });
  }

//move the basket to the left
  moveToLeft(){
    if(start) {
      setState(() {
      if(basketX-0.02 >-1){
        basketX-=0.02;
      }
      
    });
    }

  }
// Move the basket to the right
  moveToRight(){
    if(start) {
      setState(() {
      if(basketX +0.02 < 1) {
        basketX +=0.02;
      }
    });
    }

  }

void addFruit(){
  score++;
  fruitX= Random().nextDouble() * 2 - 1;
  fruitY= -1;


}
  bool collision(){
    var distance= fruitX - basketX;
     print(distance.toString());
if( distance.abs() <0.1 && fruitY > 0.85){
    return true;
    }
      else{
      return false;
  }

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fruitGame.jpg'),
                    fit: BoxFit.cover,
                    opacity: 100),
              ),


              child: Stack(children: [
                GestureDetector(
                  onHorizontalDragUpdate:  (details) {
                    if(details.delta.dx > 0){
                      moveToRight();

                    }
                    else if(details.delta.dx <0){
                      moveToLeft();
                    }
                  },
                  
                  
                  child: Basket(basketX: basketX,)),


              
                     MyFruit(fruitX:  fruitX, fruitY: fruitY,),
                      
                    
                

              ],)
            )),
        Expanded(
            child: Container(
          color: Colors.blueGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //back to the menu
              GestureDetector(
                onTap: () => context.go('/movement'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.grey[100],
                    width: 40,
                    height: 40,
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios, size: 30,),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                  onTap: startGame,
                  child: const Text(
                    "PLAY",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),

              Row(
                children: [
                  Text(
                    "score: $score",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
