import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final icone;
  final Function onPressed;

  RoundIconButton({
    @required this.icone,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: kButtonsColors,
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          icon: Icon(
            icone,
            color: Colors.white,
            size: 30,
          ),
          onPressed: onPressed,
          color: Colors.white,
        ));
  }
}