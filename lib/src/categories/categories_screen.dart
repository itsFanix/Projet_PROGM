

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const title='Games ';
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900
        ,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go("/"),
        
        ),
        title: const Text(title),
      ),
      //create a Grid of two row and 6 columns
      body: GridView.count(   
        crossAxisCount: 2,
        children: List.generate(6, (index) => 
        Center (
          //A button for each challenge 
          child: FilledButton (
            onPressed:() {
              debugPrint('you choose the challenge # $index');
              switch (index) {
                case 0 :
                context.go('/guesCountry');
                break;
                case 1:
                debugPrint('you choose the challenge # $index');
                break;

                default:
                   debugPrint('you choose the challenge # $index');
              }
            },
            child: Text('# $index'))
        )
        ),
        )

    );
    
  }

}