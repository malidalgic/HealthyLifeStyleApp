// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/constants.dart';


class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const BottomButton({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonText,
            style: kLargerButtonTextStyle,
          ),
        ),
      ),
    );
  }
}