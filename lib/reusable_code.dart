import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  final Function gesture;

  ReusableCard({@required this.colour, this.cardChild, this.gesture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gesture,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
