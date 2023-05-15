import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projet_progm/src/categories/Movements/pacManGame/path.dart';
import 'package:projet_progm/src/categories/Movements/pacManGame/pixel.dart';
import 'package:projet_progm/src/categories/Movements/pacManGame/player.dart';

class PacManScreen extends StatefulWidget {
  const PacManScreen({super.key});

  @override
  State<PacManScreen> createState() => _PacManScreenState();
}

class _PacManScreenState extends State<PacManScreen> {
  static int numberInRow = 12;
  int numberOfSquares = numberInRow * 16;
  int player = numberInRow * 14 + 1;

  Timer? countdownTimer;

  Duration myDuration = const Duration(seconds: 60);

  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    24,
    36,
    48,
    60,
    72,
    84,
    96,
    108,
    120,
    132,
    144,
    156,
    168,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    179,
    167,
    155,
    143,
    131,
    119,
    107,
    95,
    83,
    71,
    59,
    47,
    35,
    23,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    42,
    54,
    78,
    74,
    90,
    102,
    101,
    100,
    99,
    98,
    103,
    104,
    105,
    121,
    122,
    123,
    124,
    125,
    129,
    127,
    146,
    158,
    78,
    76,
    51,
    52,
    56,
    80,
    81,
    75,
    50,
    57,
    130,
    150,
    128,
    148,
    160,
    162,
    152,
    164,
    166
  ];

  List<int> food = [];
  bool preGame = true;

  String direction = "right";
  int score = 0;

  int _seconds = 20;

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        }
      });
    });
  }

// void stopTimer(){
//  countdownTimer?.cancel();
// }

  void startGame() {
    preGame = false;
    getFood();
    startTimer();
    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (_seconds == 0) {
        print("End of This Game");
        //  stopTimer();
      }

      if (food.contains(player)) {
        food.remove(player);
        score++;
      }
      switch (direction) {
        case "left":
          moveLeft();
          break;
        case "right":
          moveRight();
          break;
        case "up":
          moveUp();
          break;
        case "down":
          moveDown();
          break;
      }
    });
  }

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: const Color.fromARGB(255, 121, 170, 146),
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
                          _seconds.toString(),
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
            )),
            Expanded(
                flex: 5,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy > 0) {
                      direction = "down";
                    } else if (details.delta.dy < 0) {
                      direction = "up";
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx > 0) {
                      direction = "right";
                    } else if (details.delta.dx < 0) {
                      direction = "left";
                    }
                  },
                  child: Container(
                    color: Colors.blueGrey,
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: numberOfSquares,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numberInRow),
                        itemBuilder: (BuildContext context, int index) {
                          if (player == index) {
                            //player face the direction
                            //use Tranform.rotate
                            // switch (direction) {
                            //   case "left":
                            //     return  Transform.rotate(angle: pi, child : const MyPlayer());
                            //     break;
                            //   case "right":
                            //     moveRight();
                            //     break;
                            //   case "up":
                            //     moveUp();
                            //     break;
                            //   case "down":
                            //     moveDown();
                            //     break;
                            //   default :

                            // }
                            return const MyPlayer();
                          } else if (barriers.contains(index)) {
                            return const MySquare(
                              innerColor: Colors.black54,
                              outerColor: Colors.black,

                              // child: Text(index.toString())
                            );
                          } else if (food.contains(index) || preGame) {
                            return MyPath(
                                innerColor: Color.fromARGB(255, 241, 243, 242),
                                outerColor: Colors.blueGrey,
                                child : Image.asset('assets/images/strawberry.png'),
                                // child: Icon(Icons.apple,
                                    // size: 25, color: Colors.grey)
                                    );
                          } else {
                            return const MyPath(
                              innerColor: Colors.blueGrey,
                              outerColor: Colors.blueGrey,
                              // child: Text(index.toString())
                            );
                          }
                        }),
                  ),
                )),
          ],
        ));
  }
}
