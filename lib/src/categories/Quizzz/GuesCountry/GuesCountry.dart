import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'CounrtyApi.dart';
import 'country_model.dart';

class GuesCountry extends StatefulWidget{
  GuesCountry({super.key});

  @override
  State<GuesCountry> createState() => _GuesCountryState();
}

class _GuesCountryState extends State<GuesCountry> {
late Future<List<Country>> countries;


  @override
  void initState() {
    super.initState();
    countries = CountryApi.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    const title='GuesCountry ';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.go("/categories"),
        
        ),
        title: const Text(title),
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
          padding: const EdgeInsets.all(10),
          child: Center(
            child: FutureBuilder<List<Country>>(
              future : countries,
              builder: (context,snapshot) {
                if(snapshot.hasData){
                  // print(snapshot.data);
                return ListView( 
                  children: [
                      GestureDetector(
                          onTap:  () {context.goNamed("levelOneGuesCountry",extra:snapshot.data! );},
                          child : Container(
                            margin: const EdgeInsets.all(10),
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
                                  Text('Level 1', style: TextStyle(fontSize: 20)),
                            ))),
                  ],  
                  );
                }
                else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }
          
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              }
            ),
          ),
        ),
      )

    );
    
  }
}