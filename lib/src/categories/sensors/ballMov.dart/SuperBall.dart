

import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
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
 Timer? countdownTimer;
 int _seconds = 30;
 final audioplayer=  AudioPlayer();


moveball(AccelerometerEvent event){
  if(event == null){
    return;
  }
  setState(() {
     var reduisX = event.x/60;
     var reduisY= event.y/60;
     var  resX= posX + reduisX;
     var resY= posY + reduisY;

    if( -1 < resX && resX< 1) {
    posX =resX  ;
    }
    if(-1 < resY && resY <1){
       posY = resY;
    }

  });

}
  void startGame() {

//Subscribe to accelerometer event
audioplayer.play(AssetSource('audios/gameSong.mp3'));
startTimer();
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
    touchTarget();
    if(touchTarget()){
       score ++;
       updateTargert();
    }
      if (_seconds == 0) {
        timer.cancel();
        _showDialog();
        audioplayer.stop();
      }
  
  }
  
  );
  }

 bool touchTarget(){   
  if((posX - targetX)< 0.02 && (posY -targetY) <0.02){
      return true;
    } 
    return  false;
  }

  void updateTargert(){
     score ++;
      targetX= Random().nextDouble() * 2 - 1;
        targetY= Random().nextDouble() * 2 - 1;
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        }
        else{
          timer.cancel();
        }
      });
    });
  }

void resetGame(){
  setState(() {
    Navigator.pop(context); //dismiss
    score=0;
    _seconds = 30;
    posX= Random().nextDouble() * 2 - 1;
    posY= Random().nextDouble() * 2 - 1;
    targetX= Random().nextDouble() * 2 - 1;
   targetY= Random().nextDouble() * 2 - 1;
  });
}
void _showDialog(){
  showDialog(context: context,
   builder: (BuildContext context){
    return  AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: const Text("Time up ", style: TextStyle(color: Colors.white),),
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
      Timer(const Duration(seconds: 2), () {
context.go('/bubble');
   } );
 
}

  @override
  void dispose() {
    accel?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(children: [
    
        Expanded(child: Container(
          color: Colors.blueGrey,
          child: Row(            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //back to the menu
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
                GestureDetector(
                    onTap: startGame,
                    child: const Text(
                      "PLAY",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                      Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _seconds.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                Row(
                  children: [
                    Text(
                      "score: $score",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),             
              ],),
        )),
        Expanded(
          flex: 3,
          child: Container(
           decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/paysage2.jpg'), fit: BoxFit.cover, opacity:100),
           ),
            child: Stack(
              children: [
                 Target(targetX: targetX, targetY: targetY, color: Colors.amberAccent),
                Player(posX: posX, posY: posY),
              
              ],
            ),
          ),
        )
      ],),
    );

  }
}