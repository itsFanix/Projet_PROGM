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

//   Future<void> getCountries() async {
//      countries = (await CountryApi.getCountries()) as Future<List<Country>>;

//   // setState(() {
//   //   isLoading =false;
//   // });
// }

  @override
  void initState() {
    super.initState();
    //getCountries() ;
    countries = CountryApi.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    const title='GuesCountry ';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go("/categories"),
        
        ),
        title: const Text(title),
      ),
      //create a Grid of two row and 6 columns
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: FutureBuilder<List<Country>>(
            future : countries,
            builder: (context,snapshot) {
              if(snapshot.hasData){
                // print(snapshot.data);
              return ListView(   
               // crossAxisCount: 2,
                children: List.generate(3, (index) => 
                  //A button for each challenge 
                 FilledButton (
                    onPressed:() {
                      debugPrint('you choose the challenge # $index');
                      switch (index) {
                        case 0 :
                        context.goNamed("levelOneGuesCountry", 
                          extra:snapshot.data!,
                        // params: snapshot.data!,
                        );
                        break;
                        case 1:
                        debugPrint('you choose the challenge # $index');
                        break;
              
                        default:
                           debugPrint('you choose the challenge # $index');
                      }
                    },
                    child: Text('Level $index'))
               
                ),
                );
              }
              else if(snapshot.hasError){
                return Text('${snapshot.error}');
              }
        
              return const CircularProgressIndicator();
            }
          ),
        ),
      )

    );
    
  }
}