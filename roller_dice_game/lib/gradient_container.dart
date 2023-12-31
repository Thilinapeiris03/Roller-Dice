import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roller_dice_game/roller_dice.dart';

const beginAlignment = Alignment.bottomLeft;
const endAlignment = Alignment.topRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: beginAlignment,
              end: endAlignment,
            colors: colors)),
            child:const Center(child: RollerDice()),
        );
  }
}