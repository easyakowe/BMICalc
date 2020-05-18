import 'package:flutter/material.dart';
import 'constants.dart';

class GenderReusable extends StatelessWidget {

  final IconData columnIconName;
  final String columnText;

  const GenderReusable({this.columnIconName, this.columnText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          columnIconName,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(columnText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}