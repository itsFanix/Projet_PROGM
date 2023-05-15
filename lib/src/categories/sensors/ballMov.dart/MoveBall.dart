

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'Player.dart';

class MoveBall extends StatefulWidget {
  const MoveBall({super.key});

  @override
  State<MoveBall> createState() => _MoveBallState();
}

class _MoveBallState extends State<MoveBall> {


    Color color= Colors.lightGreenAccent;

   AccelerometerEvent? event;

   Timer? timer;
   StreamSubscription? accel;

    // static int numberInRow = 12;
   double  ballSize=20;
                                     // int numberOfSquares = numberInRow * 19;
   late double posXMax;
   late double posYMax;
    double posX=0,posY=0;
    var score=0;
    final mywidgetKey= GlobalKey();

 double top =200;

    double left = 100 ; 
  @override 
  void initState(){
    super.initState();

  }

 startGame(){
  
 }

  @override
  Widget build(BuildContext context) {
        posX=0;
   
    posY=0;
    print("width " + MediaQuery.of(context).size.width.toString());
    posXMax= MediaQuery.of(context).size.width / 2 - ballSize;
    
    posYMax = MediaQuery.of(context).size.height / 2   - 100;
  print(posYMax.toString());

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,

        body:Column(
          
          children: [
            Expanded(child: Container(
              color: const  Color.fromARGB(255, 121, 170, 146),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "score: $score",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "coucou",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: startGame,
                    child: const Text("P L A Y",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  )
                ],
              ),
            )
           
            
            ),
            Expanded(
              key: mywidgetKey,
              
             flex: 5,

             child:  
              
                          StreamBuilder<AccelerometerEvent>(
                       stream: SensorsPlatform.instance.accelerometerEvents,
                       builder: (_, snapshot) {
                       
             
                         if(snapshot.hasData){
                          posY = posY +(snapshot.data!.y);
                           posX = posX +(snapshot.data!.x);
                         }
                         if(posX>=posXMax){
                           posX = posXMax;
                         }
                         else if(posX<= -posXMax){
                           posX= -posXMax;
                         }
                         if(posY <= - posYMax){
                           posY = - posYMax;
                         }
                         else if( posY >= posYMax){
                           posY=posYMax;
                         }
                         return Player(posX: posX, posY: posY,);})

            )
          ],
        )
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //  StreamBuilder<GyroscopeEvent>(
        //   stream: SensorsPlatform.instance.gyroscopeEvents,
        //   builder: (_, snapshot) {
        //     if(snapshot.hasData){
        //       posX = posX +(snapshot.data!.x*100);
        //       posY = posY +(snapshot.data!.y*100);
        //     }
        //     return Transform.translate(
        //             offset: Offset(posX, posY),
        //             child: const CircleAvatar(
        //               radius: 20,
        //               backgroundColor: Colors.red,
        //             ),
        //           );
        // //     return Transform.translate(
        // //       offset: Offset(posX, posY),
        // //       child:  Container(
        // //   width: 60,
        // //   decoration: const BoxDecoration(
        // //     image: DecorationImage(
        // //         image: AssetImage('assets/images/background.jpg')),
        // //     shape: BoxShape.circle,
        // //   ),
        // // ),
        // //     );
        //   }
          
        //   ),
        );
        
        
        
   
  }
}
