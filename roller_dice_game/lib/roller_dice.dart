import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';


class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() =>  _RollerDiceState();
}

class  _RollerDiceState extends State <RollerDice> {
  var diceNumber = 1;
  var roll1Number = 0;
  var roll2Number = 0;
  var player1Num = 0;
  var player2Num = 0;
  
  bool _clicked1 = false;
  bool _clicked2 = false;

  void roll1(){
    setState(() {
      if(roll1Number==5){
        _clicked1 =true;
        endRoll();
      }else{
        diceNumber = Random().nextInt(6) + 1;
        player1Num += diceNumber;
        roll1Number += 1;
      }
    });
  }
  void roll2(){
    setState(() {
      // diceNumber = Random().nextInt(6) + 1;
      // player2Num += diceNumber;
      // roll2Number += 1;
      if(roll2Number==5){
        _clicked2 =true;
        endRoll();
      }else{
        diceNumber = Random().nextInt(6) + 1;
        player2Num += diceNumber;
        roll2Number += 1;
      }
    });
  }

  void endRoll(){
    setState(() {
      if(roll1Number==5 && roll2Number==5){
        if(player1Num>player2Num){
          _showMyDialog1(context);
        }else{
          _showMyDialog2(context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text("Player 1  :  ", style: TextStyle(fontSize: 20)),
                    Text("$player1Num", style: const TextStyle(fontSize: 20)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Player 2  :  ", style: TextStyle(fontSize: 20)),
                    Text("$player2Num", style: const TextStyle(fontSize: 20)),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset('assets/dice-$diceNumber.png', width: 200),
                const SizedBox(height: 20),
                TextButton(onPressed: _clicked1 ? null : roll1,
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey[300],
                  foregroundColor: Colors.black45,
                  textStyle: const TextStyle(fontSize: 18)
                ), child: const Text("Player 1 Roll")),
                const SizedBox(height: 20,),
                TextButton(onPressed: _clicked2 ? null : roll2,
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey[300],
                  foregroundColor: Colors.black45,
                  textStyle: const TextStyle(fontSize: 18)
                ), child: const Text("Player 2 Roll"))
                // Text("$diceNumber", style: const TextStyle(fontSize: 20))
              ]);
  }

  Future<void> _showMyDialog1(BuildContext context) async {
  return showDialog<void>(
    context: context ,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Winner'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('The Winner is Player 1')
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Play Again'),
            onPressed: () {
              RollerDice;
            },
          ),
          TextButton(
            child: const Text('Done'),
            onPressed: () {
              exit(0);
            },
          )
        ],
      );
    },
  );
}
Future<void> _showMyDialog2(BuildContext context) async {
  return showDialog<void>(
    context: context ,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Winner'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('The Winner is Player 2')
             
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Play Again'),
            onPressed: () {
              RollerDice;
            },
          ),
          TextButton(
            child: const Text('Exit'),
            onPressed: () {
              exit(0);
            },
          )
        ],
      );
    },
  );
}
}



