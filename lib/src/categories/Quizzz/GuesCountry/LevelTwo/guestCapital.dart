


import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:projet_progm/src/categories/Quizzz/guesCountry/LevelTwo/response.dart';


import '../country_model.dart';

class GuesCapital extends StatefulWidget{
    final List<Country> countries;

  const GuesCapital({super.key, required this.countries});
  @override
  State<GuesCapital> createState() => _GuesCapitalState();
}







class _GuesCapitalState extends State<GuesCapital> {


  //late Future<List<Music>> musics;
  late int score;
  late Country current;
  late Color containerColor;
  int live = 0;
  int total=0;
  late bool endGame;
  var lives = [];
  late int count ;
  final myaudioplayer= AudioPlayer();
  @override
  void initState() {
    super.initState();
    containerColor = Colors.white;
    score = 0;
count = 0;
    endGame = false;

    for (int i = 0; i < 3; i++) {
      lives.add( Icon(Icons.favorite, color: Colors.purple.shade600, size: 25.0));
    }
  }

// Update the state
  void updateScore() {
    setState(() {
      score++;
    });
  }

//Update Live of the player
  void updateLive() {
    if (live < 2) {
      setState(() {
        lives[live] =  Icon(
          Icons.favorite_border_outlined,
          color: Colors.purple.shade600,
        );
        live++;
      });
    } else {
      setState(() {});
       _showDialog();
      // context.goNamed("endGame",
      //     queryParams: {"score": "$score"}, extra: widget.countries);
    }
  }

  List<Country> chooseCountry(List<Country> list) {
    Set<Country> sample = {};
    while (sample.length != 4) {
      sample.add(randomChoice(list));
    }
    return sample.toList();
  }



   void _showDialog(){
  showDialog(context: context,
   builder: (BuildContext context){
    return  AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: const Text("Loose ☹", style: TextStyle(color: Colors.white),),
      content: Text("score : $score / $total", style: const TextStyle(color: Colors.white, fontSize: 25)),
      actions: [
       TextButton(
              onPressed: () => resetGame(),
              child: const Text('R E S T A R T'),
            ),
      ],
    );
   }
   
   );
      myaudioplayer.play(AssetSource('audios/background.wav'));

   
      Timer(const Duration(seconds: 3), () {
context.go('/pacMan');
   } );
 
}

void resetGame(){
  setState(() {
    Navigator.pop(context); //dismiss
    score=0;
    context.go("/guesCountry")
     
    ;
  });

}

  @override
  Widget build(BuildContext context) {

       List<Country> myList = chooseCountry(widget.countries);
    current = randomChoice(myList);
total = widget.countries.length;
    

    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
    
            child: Container (
                      alignment: Alignment.center,
                       color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //back to the menu
                GestureDetector(
                  onTap: () => context.go('/challenge'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios, size: 30, color: Colors.white,),
                    ),
                  ),
                ),
    
                // GestureDetector(
                //     onTap: startGame,
                //     child: const Text(
                //       "PLAY",
                //       style: TextStyle(color: Colors.white, fontSize: 20),
                //     )),
    
                Row(
                  children: [
                    Text(
                      "score: $score",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [for (var live in lives) live],
              )
              ],
            ),
    
    
            )),
          Expanded(
            flex: 7,
            
            child: Container(
              width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage('assets/images/capitalCountries.jpg'), fit: BoxFit.cover),
                
                
               ),
               child: Column(children: [
    
                
                Row(
                mainAxisAlignment : MainAxisAlignment.spaceAround,
                children: [
                  ResponseCapital(
                    responsedata: myList[2],
                    realresponse: current,
                    updateScore: updateScore,
                    updateLive: updateLive,
                  ),
                  // _buildDecoratedResponse(myList[2].name),
                  ResponseCapital(
                    responsedata: myList[3],
                    realresponse: current,
                    updateScore: updateScore,
                    updateLive: updateLive,
                  ),
                ],
              ),
    
               Row(
                children: [
                  ResponseCapital(
                    responsedata: myList[0],
                    realresponse: current,
                    updateScore: updateScore,
                    updateLive: updateLive,
                  ),
                  ResponseCapital(
                    responsedata: myList[1],
                    realresponse: current,
                    updateScore: updateScore,
                    updateLive: updateLive,
                  ),
                ],
              ),
               
               _buildTheContainer(),
    
    
               ],)
              
            ))
        ],
      ),
    );
    
  
  }



  Widget _buildTheResponseContainer( ) {

    return Expanded(
      child: ListView.separated(
         padding: const EdgeInsets.all(50),
         itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
               color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35)
            ),
           width: MediaQuery.of(context).size.width/2,
            height: 50,
    
            child: Center(child: Text("Hey", style: TextStyle(fontSize: 20),)),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        
        ),
    );

  }
   //  widgetBuildFlagContainer
  Widget _buildTheContainer() {
    return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height / 7,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Center(child: Text(current.capital[0], style: TextStyle(fontSize: 20),)),
    );
  }
}