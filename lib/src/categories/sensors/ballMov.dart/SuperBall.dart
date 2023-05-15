

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_progm/src/categories/sensors/ballMov.dart/Player.dart';
import 'package:projet_progm/src/categories/sensors/ballMov.dart/Target.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SuperBall extends StatefulWidget{
  const SuperBall({super.key});

  @override
  State<SuperBall> createState() => _SuperBallState();
}

class _SuperBallState extends State<SuperBall> {

  int score=0;

 double posX=0;
 double posY=1;
   double targetX= Random().nextDouble() * 2 - 1;
  double targetY= Random().nextDouble() * 2 - 1;

  //Accelerometer
 AccelerometerEvent? event;
 StreamSubscription? accel;



moveball(AccelerometerEvent event){
  if(event == null){
    return;
  }
  setState(() {
     var reduisX = event.x/100;
     var reduisY= event.y/100;
    if(posX+ reduisX < 1) {
      if(posY -reduisY> -1){
        print((posY-reduisY).toString() + "reduis" + reduisX.toString());
    posX+=  reduisX;
     posY -=reduisY;
      }
      
    }

    // if(posY -reduis >-1){
    //   posY-=reduis;
    // }
    // if(posX-reduis >-1){
    //   posX -=reduis;
    // }
    // print("acel" + event.toString() + " POSX" + posX.toString());
  });
  // setState(() {
  //    var reduis = event.x/10;
  //   if(posX-reduis > -1){
  //     posX -= reduis;
  //     print("PosX:::: " + posX.toString());
  //   }
  // });

//  setState(() {
//     posY += event.y;
//  });



}
  void startGame() {

//Subscribe to accelerometer event
    if(accel==null){
    accel= accelerometerEvents.listen((eve) {
      setState(() {
        event= eve;
      });
     });
  }
  else{
    accel!.resume();
  }

  Timer.periodic(const Duration(milliseconds: 200), (timer){
    moveball(event!);
  
  }
  
  );


  }

  @override
  void dispose() {
    accel?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Column(children: [

      Expanded(child: Container(
        color: Colors.blueGrey,
        child: Row(            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //back to the menu
              GestureDetector(
                onTap: () => context.go('/sensor'),
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
            ],),

      )),

      Expanded(
        flex: 3,
        child: Container(
          color: Colors.green,
          child: Stack(
            children: [
              //  Target(targetX: targetX, targetY: targetY, color: Colors.amberAccent),
              Player(posX: posX, posY: posY),
              // Target(
              //   targetX: targetX,
              //   targetY: targetY,
              // )
            ],
          ),
        ),
      )

      

    ],);

  }
}