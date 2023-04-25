import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../CounrtyApi.dart';
import '../country_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "dart:math";
import 'package:dart_random_choice/dart_random_choice.dart';




class LevelOneGuesCountry extends  StatefulWidget {
 final List<Country> countries;
 

const LevelOneGuesCountry({super.key, required this.countries});
  //Key?key
//required this.countries

  
  @override
   _levelOneState createState() => _levelOneState();

}


class _levelOneState  extends State<LevelOneGuesCountry> {
  
  int  score = 0;
  late Country current;
  late Color containerColor;
 
  //bool isLoading =true;

  

   @override
  void initState() {
    super.initState();  
  }

List<Country> chooseCountry(List<Country> list){
  List<Country> sample = [];
  for(int i=0; i< 4;i++) {
    //peut être les doublons
    sample.add(randomChoice(list));
  }
  return sample;

}


  @override
  Widget build(BuildContext context) {

    const title='Level 1 ';
    containerColor = Colors.white;
     List<Country> myList = chooseCountry(widget.countries);
   current = randomChoice(myList);
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go("/guesCountry"),
        
        ),
        title: Text(title,
        style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade900),
        ),
        actions: [ 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("score :  $score",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade900),
                ),
              ),

            Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: List.generate(3, (index) => 
    Icon(
      Icons.favorite,
      color: Colors.red,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
  ),
)
          
        
        ],
      ),
      //create a Grid of two row and 6 columns
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(children: [
         Padding(
           padding: const EdgeInsets.all(2.0),
           child: _buildFlagContainer(current),
         ),

         Padding(
           padding: const EdgeInsets.all(2.0),
           child: _buildResponseColumn(myList[0].name, myList[1].name,myList[2].name,myList[3].name),
         ),
        ]),
      )
         
        
     
      

    );
    
  }


Widget _buildResponseColumn(String firstCountry, String secondCountry,String third, String four){
  return Container(
    decoration: const BoxDecoration(
    ),
    child: Column(
      children: [
        _buildResponseRow(firstCountry,secondCountry),
        _buildResponseRow(third, four),

      ],
    ),
  );
}

Widget _buildResponseRow(String data, String text) => Row(
      children: [
        _buildDecoratedResponse(data),
        _buildDecoratedResponse(text),
      ],
    );



    Widget _buildDecoratedResponse(String data) => Expanded(
      
      child: GestureDetector(
        child:  Container(
        height: 100,
        decoration: BoxDecoration(
          color:containerColor,
          border: Border.all(width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.all(5),
        child: Center(child: Text(data)
      
        ),
      ),
      onTap: () {
      setState(() {
        if(data == current.name) {
          score ++;
          containerColor= Colors.green;
        }
        else {
          containerColor= Colors.red;
        }
      });
      
      },
      )
      
     
    );


  Widget _buildFlagContainer (Country current) {
   return Container(
    width : double.infinity,
    height: MediaQuery.of(context).size.height/2,
     padding: const EdgeInsets.all(10),  
    margin: const EdgeInsets.all(8),  
    decoration: BoxDecoration(
          color:Colors.white,
          border: Border.all(width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      child:  SvgPicture.network(current.flag) ,
   );
}


}














  

  





