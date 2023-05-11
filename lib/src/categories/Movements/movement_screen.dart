import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovementScreen extends StatelessWidget {
  const MovementScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Movements';
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.white),
            onPressed: () => context.go("/categories"),
          ),
          title: const Center(
              child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
        ),
        //create a Grid of two row and 6 columns
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color(0xFF701ebd),
                  Color(0xFF873bcc),
                  Color(0xFFfe4a97),
                  Color(0xFFe17763),
                  Color(0xFF68998c),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.go('/pacMan');
                      },
                      child: Container(
                          margin: const EdgeInsets.all(25),
                          height:MediaQuery.of(context).size.height/7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  const Color.fromARGB(255, 163, 143, 143).withBlue(25),
                                  const Color.fromARGB(255, 62, 199, 204),
                                  Colors.white.withBlue(5),
                                  const Color.fromARGB(255, 53, 155, 185).withBlue(25),
                                  const Color.fromARGB(255, 131, 86, 86).withBlue(25),
                                ]),
                            border: Border.all(width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text('Start',
                                style: TextStyle(fontSize: 30)),
                          ))),
                  // GestureDetector(
                  //     onTap: () {
                  //       context.go('/guesMusic');
                  //     },
                  //     child: Container(
                  //         margin: const EdgeInsets.all(25),
                  //         height: MediaQuery.of(context).size.height/3,
                  //         decoration: BoxDecoration(
                  //                gradient: LinearGradient(
                  //               begin: Alignment.topRight,
                  //               end: Alignment.bottomLeft,
                  //               colors: [
                  //                 Color.fromARGB(255, 163, 143, 143).withBlue(25),
                  //                 Color.fromARGB(255, 62, 199, 204),
                  //                 Colors.white.withBlue(5),
                  //                 Color.fromARGB(255, 53, 155, 185).withBlue(25),
                  //                 Color.fromARGB(255, 131, 86, 86).withBlue(25),
                  //               ]),
                  //           border: Border.all(width: 3),
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(10)),
                  //         ),
                  //         width: MediaQuery.of(context).size.width,
                  //         child: const Center(
                  //           child: Text('Music  Quizzzz',
                  //               style: TextStyle(fontSize: 30)),
                  //         ))),
                ],
              ),
            )));
  }
}
