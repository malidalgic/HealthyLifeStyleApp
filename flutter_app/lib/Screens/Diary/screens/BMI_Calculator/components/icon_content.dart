
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/constants.dart';



class IconContent extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;

  // ignore: use_key_in_widget_constructors
  const IconContent({required this.genderIcon, required this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 60.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}