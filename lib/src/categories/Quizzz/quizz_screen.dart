import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Quizzs';
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
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/quizBack.jpg'), fit: BoxFit.cover, opacity:100)
            ),
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
                          height:MediaQuery.of(context).size.height/6,
                          decoration: BoxDecoration(
                           
                                
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
                          height: MediaQuery.of(context).size.height/6,
                          decoration: BoxDecoration(
                                
                            border: Border.all(width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text('Music  Quizzzz',
                                style: TextStyle(fontSize: 30)),
                          ))),

                           GestureDetector(
                      onTap: () {
                        context.go('/randomQuiz');
                      },
                      child: Container(
                          margin: const EdgeInsets.all(25),
                          height: MediaQuery.of(context).size.height/6,
                          decoration: BoxDecoration(
                                
                            border: Border.all(width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text('Question Quiz',
                                style: TextStyle(fontSize: 30)),
                          ))),
                ],
              ),
            )));
  }
}
