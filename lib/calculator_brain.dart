import 'dart:math';

class CalculatorBrain {

  final int weight;
  final int height;

  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25) {
      return 'Overweight';
    }else if (_bmi >= 18.5) {
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25) {
      return 'You are Overweight. Pls cut down on some excess diet and exercise regularly. You\'re amazing!';
    }else if (_bmi >= 18.5) {
      return 'Your BMI is Normal. Keep practising good dieting and exercise regularly. You\'re amazing!';
    }else {
      return 'You are Underweight. Do eat some more balanced diet to attain a healthy BMI. You\'re amazing!';
    }
  }
}
