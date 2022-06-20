import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Screens/Profile/routes.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      initialRoute: ProfileScreen.routeName,
      routes: routes,
      theme: ThemeData(),
      home: const ProfileScreen(),
    );
  }
}
