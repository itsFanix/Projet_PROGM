import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_progm/src/categories/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myStyle = const TextStyle(fontSize: 20 );
    return Scaffold(
        //  backgroundColor: Colors.purple.shade100,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/beautiful.jpg'), fit: BoxFit.cover),

        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                   child: ElevatedButton(
                      onPressed: () {
                        debugPrint('you are going to play alone');
                        context.go("/categories");
                       // context.go("/catogories");
                      },
                      child:  Text(
                        'solo',
                        style: GoogleFonts.getFont('Lato')
                        ),
                              
                    ),
                 ),
               ),  
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                     child: ElevatedButton(
                         style:  ElevatedButton.styleFrom(
                          elevation: 4,
                         ),
                        onPressed: () {
                          debugPrint('you are going to play with your friend 🔥 🔥');
                        },
                         child:  Text('multi',style: GoogleFonts.getFont('Lato')),
                        
                     ),
                   ),
                 ),
             
              // const SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                    height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                         child:  Text('Train',
                         style: GoogleFonts.getFont('Lato'),
                         )
                         )
                      ),
                    ),
           
            ],
          ),
        ),


     

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
