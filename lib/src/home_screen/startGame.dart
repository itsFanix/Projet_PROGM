import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartChallenge extends StatefulWidget {
  const StartChallenge({super.key});

  @override
  State<StartChallenge> createState() => _StartChallengeState();
}

class _StartChallengeState extends State<StartChallenge> {
  startGame() {
    int hasard = Random().nextInt(5) + 1;
    switch (hasard) {
      case 0:
        context.go('/collect');
        break;
      case 1:
        context.go('/guesCountry');
        break;
      case 2:
        context.go('/pacMan');
        break;
      case 3:
        context.go('/bubble');
        break;
      case 4:
        context.go('/moveBall');
        break;
      case 5:
       context.go('/randomQuiz');
        break;
      default:
        context.go('/collectChallenge');
      // case 6: break;
    }
  }

// @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        //  backgroundColor: Colors.purple.shade100,
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/backThree.jpg'),
            fit: BoxFit.cover,
            opacity: 100),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: startGame,
              child: const Text("Click when you are ready"),
            ),
            ElevatedButton(
              onPressed: (){context.go('/');},
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
