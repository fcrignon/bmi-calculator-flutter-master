import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    Key key, @required this.label, @required this.onTap
  }) : super(key: key);

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColor,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: kBottomContainerHeight,
      child: FlatButton(
          onPressed: onTap,
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}