import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_code.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  'Your Result', style: kBigTitleStyle,
                ),
              ),
            ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kResultDiagnosisStyle,),
                  Text(bmiResult.toUpperCase(), style: kHugeLabelTextStyle,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(interpretation.toUpperCase(), style: kDescriptionStyle,),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'RE-CALCULATE',
                  style: kBottomTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
