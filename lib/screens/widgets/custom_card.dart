import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.colour, this.containerChild,this.onPress});

  final Color colour;
  final Widget containerChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
          child: Container(
        height: 200.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colour,
        ),
        child: containerChild,
      ),
    );
  }
}