import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_progm/src/categories/Quizzz/generalQuestion/Quizapi.dart';

import 'QuizModel.dart';

class RandomQuiz extends StatefulWidget {
  const RandomQuiz({super.key});

  @override
  State<RandomQuiz> createState() => _RandomQuizState();
}

class _RandomQuizState extends State<RandomQuiz> {
  late Future<List<Quiz>> quiz;

  late List<Quiz> myQuiz;

  int score = 0;
  int _seconds = 60;
  int questiontotal = 20;
  int etape = 0;
  int nbCorrect= 0;
  bool answer = true;

  final myaudioplayer =AudioPlayer();

  Timer? countdownTimer;
  late int count;
  @override
  void initState() {
    super.initState();
    myQuiz = List.empty();
    quiz = QuizApi.getRandomQuiz();
  }

  // startGame() {
  //   startTimer();
  //   Timer.periodic(Duration(seconds: 60), (timer) {
  //     startTimer();
  //   });
  // }

  // void startTimer() {
  //   _seconds = 60;
  //   countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if (_seconds > 0) {
  //         _seconds--;
  //       } else {
  //         timer.cancel();
  //       }
  //     });
  //   });
  // }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: const Text(
                "END ",
                
              ),
            ),
            content: Text("score : $score ::: $nbCorrect / $questiontotal", 
                style: const TextStyle(color: Colors.white, fontSize: 25)),
            actions: [
              TextButton(
                onPressed: () => resetGame(),
                child: const Text('R E S T A R T'),
              ),
            ],
          );
        });

     Timer(const Duration(seconds: 2), () {

      if(nbCorrect >=10){
        context.go('/enGame');
      }
      context.go('/moveBall');
     } );
  }

  void resetGame() {
    setState(() {
      Navigator.pop(context); //dismiss
      score = 0;
      _seconds = 60;
      etape = 0;
      nbCorrect=0;

    });
  }

  void checkAnswer(index) {
    answer = myQuiz[etape].options[index]['isCorrect'];
    if (answer) {
      setState(() {
        myaudioplayer.play(AssetSource('audios/correct_answer.wav'));
        myaudioplayer.stop();
        score+=10;
        nbCorrect +=1;
      });
    } else {
      setState(() {
        myaudioplayer.play(AssetSource('audios/wrong_answer_buz.wav'));
        myaudioplayer.stop();
        score -= 2;
      });
    }

    setState(() {
      if (etape + 1 < 20) {
        etape++;
      }
      else{
        _showDialog();
        myaudioplayer.play(AssetSource('audios/funny_game_over.wav'));
        myaudioplayer.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
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
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Text(
                "Quiz: ${etape+1} ",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              // Row(
              //   children: [
              //     const Icon(
              //       Icons.access_time,
              //       color: Colors.white,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //         _seconds.toString(),
              //         style: const TextStyle(
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20),
              //       ),
              //     ),
              //   ],
              // ),

              Row(
                children: [
                  Text(
                    "score: $score",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ],
          ),
        )),
        Expanded(
            flex: 7,
            child: FutureBuilder<List<Quiz>>(
              future: quiz,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  myQuiz = snapshot.data!;
                  print(myQuiz[0].options);
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/quiZBack2.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          _buildTheContainer(),
                          _buildTheResponseContainer()
                        ],
                      ));
                } else {
                return  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
      ],
    );
  }

  Widget _buildTheResponseContainer() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(50),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              checkAnswer(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: Center(
                  child: Text(
                myQuiz[etape].options[index]['option'],
                style: TextStyle(fontSize: 20),
              )),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  //  widgetBuildFlagContainer
  Widget _buildTheContainer() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(25)),
      child: Text(myQuiz[etape].question, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
    );
  }
}
