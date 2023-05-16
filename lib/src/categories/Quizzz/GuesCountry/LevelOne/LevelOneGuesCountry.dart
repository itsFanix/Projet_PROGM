import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:projet_progm/src/categories/Quizzz/guesCountry/LevelOne/responseWidget.dart';


import '../country_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dart_random_choice/dart_random_choice.dart';

class LevelOneGuesCountry extends StatefulWidget {
  final List<Country> countries;

  const LevelOneGuesCountry({super.key, required this.countries});
  //Key?key
//required this.countries

  @override
  _levelOneState createState() => _levelOneState();
}

class _levelOneState extends State<LevelOneGuesCountry> {
  late int score;
  late Country current;
  late Color containerColor;
   int total= 0;
  int live = 0;
  late bool endGame;
  var lives = [];
  late int count ;
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
      title: const Text("E N D ☹ ", style: TextStyle(color: Colors.white),),
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
      Timer(const Duration(seconds: 2), () {
        if(score < total)
        context.go('/collect');
        else {
          context.go('/challenge');
        }
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

    total = widget.countries.length;
       List<Country> myList = chooseCountry(widget.countries);
    current = randomChoice(myList);
    return Column(
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

              _buildFlagContainer(),


              Row(
              children: [
                ResponseWidget(
                  responsedata: myList[2].name,
                  realresponse: current.name,
                  updateScore: updateScore,
                  updateLive: updateLive,
                ),
                // _buildDecoratedResponse(myList[2].name),
                ResponseWidget(
                  responsedata: myList[3].name,
                  realresponse: current.name,
                  updateScore: updateScore,
                  updateLive: updateLive,
                ),
              ],
            ),

             Row(
              children: [
                ResponseWidget(
                  responsedata: myList[0].name,
                  realresponse: current.name,
                  updateScore: updateScore,
                  updateLive: updateLive,
                ),
                ResponseWidget(
                  responsedata: myList[1].name,
                  realresponse: current.name,
                  updateScore: updateScore,
                  updateLive: updateLive,
                ),
              ],
            ),
             
             


             ],)
            
          ))
      ],
    );
    
  
  }



  // Widget _buildTheResponseContainer( ) {

  //   return Expanded(
  //     child: ListView.separated(
  //        padding: const EdgeInsets.all(50),
  //        itemCount: 4,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           decoration: BoxDecoration(
  //              color: Colors.white,
  //         shape: BoxShape.rectangle,
  //         borderRadius: BorderRadius.circular(35)
  //           ),
  //          width: MediaQuery.of(context).size.width/2,
  //           height: 50,
    
  //           child: Center(child: Text("Hey", style: TextStyle(fontSize: 20),)),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) => const Divider(),
        
  //       ),
  //   );

  // }
  Widget _buildFlagContainer() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SvgPicture.network(current.flag),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     List<Country> myList = chooseCountry(widget.countries);
//     current = randomChoice(myList);
//     return Scaffold(
//       extendBodyBehindAppBar: true,
        
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () => context.go("/guesCountry"),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "score :  $score",
//                 textAlign: TextAlign.center,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.purple.shade900),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [for (var live in lives) live],
//             )
//           ],
//         ),
//         //create a Grid of two row and 6 columns
//         body: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage('assets/images/countriesback.jpg'), fit: BoxFit.cover, opacity:100)
//                ),
//             child: bodyBuild(myList)));
//   }

//   Padding bodyBuild(List<Country> myList) {
//     return Padding(
//       padding: const EdgeInsets.all(2),
//       child: Column(children: [
//         Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: _buildFlagContainer(),
//         ),
//         Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Row(
//               children: [
//                 ResponseWidget(
//                   responsedata: myList[2].name,
//                   realresponse: current.name,
//                   updateScore: updateScore,
//                   updateLive: updateLive,
//                 ),
//                 // _buildDecoratedResponse(myList[2].name),
//                 ResponseWidget(
//                   responsedata: myList[3].name,
//                   realresponse: current.name,
//                   updateScore: updateScore,
//                   updateLive: updateLive,
//                 ),
//               ],
//             )),
//         Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Row(
//               children: [
//                 ResponseWidget(
//                   responsedata: myList[0].name,
//                   realresponse: current.name,
//                   updateScore: updateScore,
//                   updateLive: updateLive,
//                 ),
//                 ResponseWidget(
//                   responsedata: myList[1].name,
//                   realresponse: current.name,
//                   updateScore: updateScore,
//                   updateLive: updateLive,
//                 ),
//               ],
//             ))
//       ]),
//     );
//   }

//   //  widgetBuildFlagContainer
//   Widget _buildFlagContainer() {
//     return Container(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height / 2,
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(width: 4),
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//       ),
//       child: SvgPicture.network(current.flag),
//     );
//   }
// }
