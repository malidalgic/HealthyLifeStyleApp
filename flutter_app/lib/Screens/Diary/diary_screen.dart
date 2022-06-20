import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/Diary_Home/constants.dart';
import 'package:flutter_app/Screens/Diary/screens/Diary_Home/pages/body.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const Body(),
    );
  }
}