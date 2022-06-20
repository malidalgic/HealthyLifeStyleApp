import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/calculator_brain.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/components/bottom_button.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/components/icon_content.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/components/reusable_card.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/components/round_icon_button.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/constants.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/screens/results_page.dart';
import 'package:flutter_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // bool ageMinusButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    var ageMinusButtonDisabled = false;
    var weightMinusButtonDisabled = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: const Center(
          child: Text('HEALTH CALCULATOR'),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 194, 92, 241),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'HEIGHT',
                              style: kLabelTextStyle,
                            ),
                            SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    height.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  const Text(
                                    'cm',
                                    style: kLabelTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 2.0,
                                activeTrackColor: Colors.black,
                                thumbColor: Colors.black,
                                overlayColor: const Color(0x29EB1555),
                                inactiveTrackColor: const Color(0xFF8D8E98),
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 12.0),
                                overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 24.0),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 250.0,
                                divisions: 250,
                                label: height.round().toString(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      weight.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    const Text(
                                      'kg',
                                      style: kLabelTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                AbsorbPointer(
                                  absorbing: weightMinusButtonDisabled,
                                  child: RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        if (weight == 10) {
                                          weightMinusButtonDisabled = true;
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text(
                                                  'Minimum weight reached!'),
                                              content: const Text(
                                                  'Cannot calculate for weight less than 10.'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          weight--;
                                          weightMinusButtonDisabled = false;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onPress: () {},
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // RoundIconButton(
                              //   icon: Icons.remove,
                              //   onPressed: () {
                              //     setState(() {
                              //       age--;
                              //     });
                              //   },
                              // ),
                              AbsorbPointer(
                                absorbing: ageMinusButtonDisabled,
                                child: RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (age == 10) {
                                        ageMinusButtonDisabled = true;
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Minimum age reached!'),
                                            content: const Text(
                                                'Cannot calculate for age less than 10.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        age--;
                                        ageMinusButtonDisabled = false;
                                      }
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                    // ageMinusButtonDisabled = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      onPress: () {},
                    ),
                  ),
                ]),
              ),
            ),
            BottomButton(
                buttonText: 'CALCULATE',
                onTap: () {
                  if (selectedGender == null) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Gender not selected!'),
                        content: const Text('Please select a gender first.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    CalculatorBrain calc = CalculatorBrain(
                      height: height,
                      weight: weight,
                      age: age,
                      gender: selectedGender!,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultsPage(
                            bmiResults: calc.calculateBMI(),
                            bmiResultText: calc.getBMIResult(),
                            // bmiInterpretation: calc.getBMIInterpretation(),
                            bfpResults: calc.calculateBFP(),
                            bfpResultText: calc.getBFPResult(),
                            bmrResults: calc.calculateBMR(),
                          );
                        },
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
