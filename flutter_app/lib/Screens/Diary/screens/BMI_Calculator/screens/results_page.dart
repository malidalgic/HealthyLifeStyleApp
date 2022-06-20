// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/components/bottom_button.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/components/reusable_card.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/constants.dart';
import 'package:flutter_app/constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResults;
  final String bmiResultText;
  // final String bmiInterpretation;
  final String bfpResults;
  final String bfpResultText;
  final String bmrResults;

  const ResultsPage(
      {required this.bmiResults,
      required this.bmiResultText,
      required this.bfpResults,
      required this.bfpResultText,
      required this.bmrResults});

  Color getBMIResultTextColor() {
    if (bmiResultText == 'overweight') {
      return Colors.red;
    } else if (bmiResultText == 'normal') {
      return const Color(0xFF24D876);
    } else if (bmiResultText == 'underweight') {
      return Colors.yellow;
    } else {
      return Colors.white;
    }
  }

  Color getBFPResultTextColor() {
    if (bfpResultText == 'Very Low!') {
      return Colors.red;
    } else if (bfpResultText == 'Excellent') {
      return const Color(0xFF24D876);
    } else if (bfpResultText == 'Good') {
      return const Color(0xFF24D876);
    } else if (bfpResultText == 'Fair') {
      return Colors.yellow;
    } else if (bfpResultText == 'High') {
      return Colors.red;
    } else if (bfpResultText == 'Very High!') {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('YOUR RESULTS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: const [
                      Text(
                        'BMI',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '(Body Mass Index)',
                        style: kSmallLabelTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    bmiResultText.toUpperCase(),
                    style: TextStyle(
                      color: getBMIResultTextColor(),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    bmiResults,
                    style: kBMITextStyle,
                  ),
                  Column(
                    children: const <Widget>[
                      Text(
                        'Normal BMI Range: ',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'BFP',
                            style: kLabelTextStyle,
                          ),
                          const Text(
                            '(Body Fat Percentage)',
                            style: kSmallLabelTextStyle,
                          ),
                          Text(
                            bfpResultText,
                            style: TextStyle(
                              color: getBFPResultTextColor(),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2.0,
                            ),
                          ),
                          Text(
                            bfpResults,
                            style: kBMITextStyle,
                          ),
                        ],
                      ),
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'BMR',
                            style: kLabelTextStyle,
                          ),
                          const Text(
                            '(Basal Metabolic Rate)',
                            style: kSmallLabelTextStyle,
                          ),
                          const Text(
                            'Calories per day',
                            style: kResultTextStyle,
                          ),
                          Text(
                            bmrResults,
                            style: kBMITextStyle,
                          ),
                        ],
                      ),
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
