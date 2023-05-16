


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_progm/src/categories/Quizzz/guesMusic/musicApi.dart';

import 'musicModel.dart';

class GuesMusic extends StatefulWidget{
  @override
  State<GuesMusic> createState() => _GuesMusicState();
}







class _GuesMusicState extends State<GuesMusic> {


  late Future<List<Music>> musics;

  int score= 0;

  var lives = [];
  late int count ;
  @override
  void initState() {
    super.initState();

    musics = MusicApi.getMusictracks();
    print(musics);
    
    score = 0;
    count = 0;
    for (int i = 0; i < 3; i++) {
      lives.add( Icon(Icons.favorite, color: Colors.black, size: 25.0));
    }
  }
  startGame(){

  }
  @override
  Widget build(BuildContext context) {

    

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
               image: DecorationImage(image: AssetImage('assets/images/musicTrois.jpg'), fit: BoxFit.cover),
              
              
             ),
             child: Column(children: [

             _buildTheContainer(),

             _buildTheResponseContainer()

             ],)
            
          ))
      ],
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
      height: MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Text("Coucou"),
    );
  }
}