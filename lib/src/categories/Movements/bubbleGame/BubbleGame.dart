import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_progm/src/categories/movements/bubbleGame/ball.dart';
import 'package:projet_progm/src/categories/movements/bubbleGame/bottom.dart';
import 'package:projet_progm/src/categories/movements/bubbleGame/player.dart';


import 'missile.dart';


class BubbleScreen extends StatefulWidget {
  const BubbleScreen({super.key});

  @override
  State<BubbleScreen> createState() => _BubbleScreenState();
}

enum direction{LEFT, RIGHT}

class _BubbleScreenState extends State<BubbleScreen> {

 static  double playerX=0;


  //missile

  double missileX= playerX;

  double missileHeight=10;
  bool midShot=false;

  double ballX=0.5;
  double ballY=1;

var  ballDirection=direction.LEFT;

int  score = 0;


void moveLeft(){
  setState(() {
    if(playerX-0.1 > -1) {
      playerX -=0.1;
    }
    if(!midShot) {
      missileX=playerX;
    }
  });

}

void moveRight(){
setState(() {
 
  if(playerX +0.1<1) {
    playerX+=0.1;
  }
  if(!midShot) {
    missileX=playerX;
  }
});
}

void fireMissile(){
  if(!midShot){
    Timer.periodic(const Duration(milliseconds: 20), (timer){

      midShot=true;


  setState(() {
      missileHeight+=10;{
      }  
    });
    
    //stop missile when it reaches top of screen
  if(missileHeight>MediaQuery.of(context).size.height*3/4){
        timer.cancel();
        resetMissile();
       
      }
     
  

//check if missile has hit the ball
if(ballY>heightToCoordinate(missileHeight) && (ballX-missileX).abs()<0.03 ){
  resetMissile();
  ballX= 5;
  timer.cancel();
  score++;  //update the score
}
  });
  }

}

// Converts height to a coordinate
double heightToCoordinate(double height){
   double totalHeight = MediaQuery.of(context).size.height *3/4;
   double position = 1 -2*height/totalHeight;
   return position;
}
void resetMissile(){
  missileX=playerX;
  missileHeight=10;
   midShot=false;

}


void startGame(){

  double time=0;
  double height=0;
  double velocity= 60; //how strong the jump is

   Timer.periodic(Duration(milliseconds: 5)
   , (timer) {

    //quadratic equation that models a bounce (upside down parabola)
    height = -5 * time *time + velocity *time;


    if(height <0){
      time=0;
    }

//update the new posiiton
    setState(() {
      ballY= heightToCoordinate(height);
    });

     

    if(ballX-0.005<-1){
      ballDirection= direction.RIGHT;

    } else if( ballX+0.005>1){
      ballDirection= direction.LEFT;

    }
    //move the ball in the correct direction
  if(ballDirection == direction.LEFT){
     setState(() {
       ballX-=0.005;
     });
  }
  else if(ballDirection== direction.RIGHT){
    setState(() {
      ballX+=0.005;
    });
  }


if(playerDies()){
  timer.cancel();
  print("Died");
  _showDialog();
}
//keep the time going
time+=0.1; 
  });

}


void _showDialog(){
  showDialog(context: context,
   builder: (BuildContext context){
    return  AlertDialog(
      backgroundColor: Colors.black,
      title: const Text("Dead Dead 😢😢 💀", style: TextStyle(color: Colors.white),),
      content: Text("score : $score", style: TextStyle(color: Colors.white, fontSize: 25)),
      actions: [
       TextButton(
              onPressed: () => setState(() {
                resetGame();
              }),
              child: const Text('R E S T A R T'),
            ),
      ],
    );
   }
   
   );

     Timer(const Duration(seconds: 2), () {
context.go('/guesCountry');
   } );
 
}


void resetGame(){
  setState(() {
    Navigator.pop(context); //dismiss
    score=0;
 playerX=0;



missileX= playerX;

 missileHeight=10;
 midShot=false;

 ballX=0.5;
 ballY=1;

  ballDirection=direction.LEFT;

  });

}
bool playerDies(){
  if((ballX -playerX) <0.05    && ballY > 0.95){
    return true;
    }
      else{
      return false;
  }
}

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent event){
        if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)){
          moveLeft();
        } else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight)){
          moveRight();
        }
        if(event.isKeyPressed(LogicalKeyboardKey.space)){
           
           fireMissile();
        }

      },
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/gameOneBack.jpg'),
                          fit: BoxFit.cover,
                          opacity: 100)),
                  child: Stack(
                    children: [
                    MyBall(ballX: ballX, ballY: ballY),
                    Missile(
                      missileHeight: missileHeight,
                      missileX: missileX,
                    ),
                    
                    MyPlayer(playerX: playerX),
                    ],
                  ))),
          Expanded(
              child: Container(
            color: Colors.grey,
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [

                  GestureDetector(
                onTap: () => context.go('/challenge'),
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
              MyBottom(icon: Icons.play_arrow,
              function: startGame,
              ),
              MyBottom(
                icon: Icons.arrow_back,
                function: moveLeft,
              ),
              MyBottom(
                icon: Icons.arrow_upward,
                function: fireMissile,
              ),
              MyBottom(icon: Icons.arrow_forward,
              function: moveRight,
              
              ),
    
            ]),
          ))
        ],
      ),
    );
  }
}
