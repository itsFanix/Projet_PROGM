import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Quizzs';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade400,
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
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.purple.shade800,
                  Colors.purple.shade700,
                  Colors.purple.shade600,
                  Colors.purple.shade500,
                  Colors.purple.shade400,
                ])),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.go('/guesCountry');
                      },
                      child: Container(
                          margin: const EdgeInsets.all(25),
                          height:MediaQuery.of(context).size.height/3,
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
                            child: Text('Countries Quizzzz',
                                style: TextStyle(fontSize: 30)),
                          ))),
                  GestureDetector(
                      onTap: () {
                        context.go('/guesMusic');
                      },
                      child: Container(
                          margin: const EdgeInsets.all(25),
                          height: MediaQuery.of(context).size.height/3,
                          decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromARGB(255, 163, 143, 143).withBlue(25),
                                  Color.fromARGB(255, 62, 199, 204),
                                  Colors.white.withBlue(5),
                                  Color.fromARGB(255, 53, 155, 185).withBlue(25),
                                  Color.fromARGB(255, 131, 86, 86).withBlue(25),
                                ]),
                            border: Border.all(width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text('Music  Quizzzz',
                                style: TextStyle(fontSize: 30)),
                          ))),
                ],
              ),
            )));
  }
}
