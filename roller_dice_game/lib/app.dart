import 'package:flutter/material.dart';
import 'package:roller_dice_game/gradient_container.dart';

const beginAlignment = Alignment.bottomLeft;
const endAlignment = Alignment.topRight;

class RollerDiceApp extends StatelessWidget{
  const RollerDiceApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[200],     
           title:const Text('Roller Dice'),
        ),
        body: const GradientContainer(
          colors: [
            Color.fromARGB(235, 0, 106, 255),
            Color.fromARGB(236, 255, 255, 255)
            ],
        ),
      ),
    );
  }
}