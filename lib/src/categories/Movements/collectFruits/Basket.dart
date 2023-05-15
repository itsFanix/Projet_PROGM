
import 'package:flutter/material.dart';

class Basket extends StatelessWidget{

  final basketX;

  const Basket({super.key, this.basketX}); 


  @override
  Widget build(BuildContext context) {
    return  Container(
     alignment: Alignment(basketX, 1),
     child: ClipRRect(
       child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(image: AssetImage('assets/images/Emptybasket.png'), fit: BoxFit.cover)
        ),
        //  color: Colors.pink,
         height: 50,
         width: 100,
       ),
     ),
   );
  }

    
  }

