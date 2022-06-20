import 'dart:math';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/screens/input_page.dart';



class CalculatorBrain {
  final int height;
  final int weight;
  final Gender gender;
  final int age;
late  double _bmi;
 late double _bfp;
 late double _bmr;

  CalculatorBrain(
      {required this.height,
      required this.weight,
      required this.gender,
      required this.age});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi >= 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  // String getBMIInterpretation() {
  //   if (_bmi >= 25) {
  //     return 'You have a higher than normal body weight. Try to exercise more.';
  //   } else if (_bmi >= 18.5) {
  //     return 'You have a normal body weight. Good job!';
  //   } else {
  //     return 'You have a lower than normal body weight. You can eat a bit more.';
  //   }
  // }

  String calculateBFP() {
    if (gender == Gender.male) {
      _bfp = (1.20 * _bmi) + (0.23 * age) - 16.2;
      return _bfp.toStringAsFixed(1);
    } else {
      _bfp = (1.20 * _bmi) + (0.23 * age) - 5.4;
      return _bfp.toStringAsFixed(1);
    }
  }

  String getBFPResult() {
    if (age < 20) {
      return '';
    } else if (gender == Gender.male) {
      if (_bfp < 8) {
        return 'Very Low!';
      } else if (age >= 20 && age <= 29) {
        if (_bfp <= 10.5) {
          return 'Excellent';
        } else if (_bfp <= 14.8) {
          return 'Good';
        } else if (_bfp <= 18.6) {
          return 'Fair';
        } else if (_bfp <= 23.1) {
          return 'High';
        } else if (_bfp >= 23.2) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 30 && age <= 39) {
        if (_bfp <= 14.5) {
          return 'Excellent';
        } else if (_bfp <= 18.2) {
          return 'Good';
        } else if (_bfp <= 21.3) {
          return 'Fair';
        } else if (_bfp <= 24.9) {
          return 'High';
        } else if (_bfp >= 25) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 40 && age <= 49) {
        if (_bfp <= 17.4) {
          return 'Excellent';
        } else if (_bfp <= 20.6) {
          return 'Good';
        } else if (_bfp <= 23.4) {
          return 'Fair';
        } else if (_bfp <= 26.6) {
          return 'High';
        } else if (_bfp >= 26.7) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 50 && age <= 59) {
        if (_bfp <= 19.1) {
          return 'Excellent';
        } else if (_bfp <= 22.1) {
          return 'Good';
        } else if (_bfp <= 24.6) {
          return 'Fair';
        } else if (_bfp <= 27.8) {
          return 'High';
        } else if (_bfp >= 27.9) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 60) {
        if (_bfp <= 19.7) {
          return 'Excellent';
        } else if (_bfp <= 22.6) {
          return 'Good';
        } else if (_bfp <= 25.2) {
          return 'Fair';
        } else if (_bfp <= 28.4) {
          return 'High';
        } else if (_bfp >= 28.5) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      }
    } else if (gender == Gender.female) {
      if (_bfp < 14) {
        return 'Very Low!';
      } else if (age >= 20 && age <= 29) {
        if (_bfp <= 16.5) {
          return 'Excellent';
        } else if (_bfp <= 19.4) {
          return 'Good';
        } else if (_bfp <= 22.7) {
          return 'Fair';
        } else if (_bfp <= 27.1) {
          return 'High';
        } else if (_bfp >= 27.2) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 30 && age <= 39) {
        if (_bfp <= 17.4) {
          return 'Excellent';
        } else if (_bfp <= 20.8) {
          return 'Good';
        } else if (_bfp <= 24.6) {
          return 'Fair';
        } else if (_bfp <= 29.2) {
          return 'High';
        } else if (_bfp >= 29.2) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 40 && age <= 49) {
        if (_bfp <= 19.8) {
          return 'Excellent';
        } else if (_bfp <= 23.8) {
          return 'Good';
        } else if (_bfp <= 27.6) {
          return 'Fair';
        } else if (_bfp <= 31.9) {
          return 'High';
        } else if (_bfp >= 31.3) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 50 && age <= 59) {
        if (_bfp <= 22.5) {
          return 'Excellent';
        } else if (_bfp <= 27) {
          return 'Good';
        } else if (_bfp <= 30.4) {
          return 'Fair';
        } else if (_bfp <= 34.5) {
          return 'High';
        } else if (_bfp >= 34.6) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      } else if (age >= 60) {
        if (_bfp <= 23.2) {
          return 'Excellent';
        } else if (_bfp <= 27.9) {
          return 'Good';
        } else if (_bfp <= 31.3) {
          return 'Fair';
        } else if (_bfp <= 35.4) {
          return 'High';
        } else if (_bfp >= 35.5) {
          return 'Very High!';
        } else {
          return 'Can\'t calculate!!!';
        }
      }
    } 
      return 'null';
    
  }

  String calculateBMR() {
    if (gender == Gender.male) {
      _bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      return _bmr.toStringAsFixed(1);
    } else if (gender == Gender.female) {
      _bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      return _bmr.toStringAsFixed(1);
    } else {
      return 'null';
    }
  }
}

// Men: BMR = 88.362 + (13.397 x weight in kg) + (4.799 x height in cm) – (5.677 x age in years)
// Women: BMR = 447.593 + (9.247 x weight in kg) + (3.098 x height in cm) – (4.330 x age in years)