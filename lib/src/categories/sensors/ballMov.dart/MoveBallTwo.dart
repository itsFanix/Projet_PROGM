import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MoveBallTwo extends StatefulWidget{
  const MoveBallTwo({super.key});

  @override
  State<MoveBallTwo> createState() => _MoveBallTwoState();
}

class _MoveBallTwoState extends State<MoveBallTwo> {

  Color color= Colors.lightGreenAccent;

   AccelerometerEvent? event;

   Timer? timer;
   StreamSubscription? accel;

  double top =125;
    double? left ; 
  int count =0;

  late double width;
  late double height;
  

  setColor(AccelerometerEvent event){

    double x = ((event.x * 12)+ ((width-100)/2));
    double y = (event.y *12+125);

    var xDiff = x.abs() -((width-100)/2);
    var yDiff = y.abs() -125;


    if(xDiff.abs() <3  && yDiff.abs() <3) {
      setState(() {
        color = Colors.greenAccent;
        count++;
      });
    }
      else{
        setState(() {
          color = Colors.red;
          count = 0;
        });

      }
    }
  
  setPosition(AccelerometerEvent event){
    if(event == null){
      return;
    }

    setState(() {
      left= ((event.x*12)+(width-100)/2);
    });

    setState(() {
      top=event.y*12 +125;
    });
  }

  
  startTimer(){
    if(accel==null){
      accel = accelerometerEvents.listen((eve) {
        setState(() {
           event = eve;
        });
      });
    }
    else{
      accel!.resume();
    }

    if(timer ==null || !timer!.isActive){
      timer = Timer.periodic(const Duration(milliseconds: 200)
      , (timer) {
        if(count > 3){
          pauseTimer();

        } else {
          setColor(event!);
          setPosition(event!);
        }
       });
    }
  }

  pauseTimer(){
    timer!.cancel();
    accel!.pause();

    setState(() {
      count=0;
      color = Colors.green;
    });
  }

  @override
  dispose(){
    timer?.cancel();
    accel?.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    width= MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Column(
        children: [
          Text("keep"),
          Stack(
            children: [
              Container(height: height/2,width:width),
              // R
              Positioned(
                top:top,
                left: left ?? (width-100)/2,
                child: ClipOval(child: Container(width:100, height: 100, color:color)),
              ),
              Positioned(
                  top:125,
                  left: (width-100)/2,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.green, width:2.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 16.0),
                child: ElevatedButton(onPressed: startTimer, child: Text("Begin"),
                
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}