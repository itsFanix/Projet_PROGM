import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const title = ' Categories';
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.white),
            onPressed: () => context.go("/"),
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
              image: DecorationImage(image: AssetImage('assets/images/backtwo.jpg'), fit: BoxFit.cover,opacity: 100),
               
                ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  GestureDetector(
                        onTap:  () {context.go('/quiz');},
                        child : Container(
                          margin: const EdgeInsets.all(25),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child:
                                Text('Quizzzz', style: TextStyle(fontSize: 20)),
                          ))),

               GestureDetector(
                    onTap: () {context.go('/sensor');},
                    child :   Container(
                      margin: const EdgeInsets.all(25),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text('Sensors', style: TextStyle(fontSize: 20)),
                      ))),

                  GestureDetector(
                     onTap:  () {context.go('/movement');} ,
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'Movements',
                          style: TextStyle(fontSize: 20),
                        ),
                      ))),
                      
                       GestureDetector(
                     onTap:  () {context.go('/movement');} ,
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'Random',
                          style: TextStyle(fontSize: 20),
                        ),
                      )))
                ],
              ),
            )
            ));
  }
}
