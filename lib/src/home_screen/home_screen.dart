import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

// @override
  @override
  Widget build(BuildContext context) {
    var myStyle = const TextStyle(fontSize: 20 );

  //   final player= AudioPlayer();
  //  player.setSource(AssetSource('assets/audios/gameSong.mp3'));
    // player.setSourceAsset('assets/audios/gameSong.mp3');
    // player.resume();
    // audioPlayer.play()
    // player.play('assets/audios/gameSong.mp3');


    final TextEditingController playerName = TextEditingController();
    return Scaffold(
        //  backgroundColor: Colors.purple.shade100,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/backThree.jpg'), fit: BoxFit.cover, opacity:100),

        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child:  Image.asset('assets/images/logo.png'),
        //              decoration: const BoxDecoration(
        //   image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover, opacity:100),

        // ),
                  ),
                //  child: TextField(
                //     controller: playerName,
                //     decoration: const InputDecoration(
                //      border: OutlineInputBorder(
                //       borderSide: BorderSide(width: 5, color: Colors.black),
                //       borderRadius: BorderRadius.all(Radius.circular(15))
                //      ),
                //      hintText:'Name'
                //     ),
                //     style: const TextStyle(fontSize: 30, color: Colors.white),
                //   ),
               ),
          
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50,
                   child: OutlinedButton(
                      onPressed: () {
                        debugPrint('you are going to play alone');
                        // context.go("/categories");
                        context.go("/challenge");
                      },
                      child:  const Text(
                        'Solo',
                        style: TextStyle(fontSize: 20, color: Colors.white)
                        ),
                    
                    ),
                 ),
               ),  
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50,
                     child: OutlinedButton(
                         style:  ElevatedButton.styleFrom(
                          elevation: 4,
                         ),
                        onPressed: () {
                          debugPrint('you are going to play with your friend 🔥 🔥');
                          context.go('/wifiptop');
                        },
                         child:  const Text('Multi', style: TextStyle(fontSize: 20, color: Colors.white)),
                        
                     ),
                   ),
                 ),
             
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                      width: MediaQuery.of(context).size.width/2,
                    height: 50,
                        child: OutlinedButton(
                          onPressed: () {context.go('/categories');},
                         child:  const Text('Train',
                         style: TextStyle(fontSize: 20, color: Colors.white),
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
