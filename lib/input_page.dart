import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_code.dart';
import 'constants.dart';
import 'round_icon.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderIndicator{
  male,
  female,
}

class _InputPageState extends State<InputPage> {

  GenderIndicator gender;
  int height = 180;
  int weight = 50;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                child: ReusableCard(
                  gesture: () {
                    setState(() {
                      gender = GenderIndicator.male;
                    });
                  },
                  colour: gender == GenderIndicator.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: GenderReusable(
                    columnIconName: FontAwesomeIcons.mars,
                    columnText: 'MALE',
                  ),
                ),
              ),
                Expanded(
                child: ReusableCard(
                  gesture: (){
                    setState(() {
                      gender = GenderIndicator.female;
                    });
                  },
                  colour: gender == GenderIndicator.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: GenderReusable(
                    columnIconName: FontAwesomeIcons.venus,
                    columnText: 'FEMALE',
                  ),
                ),
              ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kHugeLabelTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFF816BC2),
                      overlayColor: Color(0x29816BC2),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                    ),
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kHugeLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle,),
                        Text(age.toString(), style: kHugeLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
            },),);
            },
            child: Container(
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'CALCULATE',
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




