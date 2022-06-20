import 'package:flutter/widgets.dart';
import 'package:flutter_app/Screens/Profile/components/body.dart';
import 'package:flutter_app/Screens/Profile/components/myacc.dart';
import 'package:flutter_app/Screens/Profile/components/privacy.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ProfileScreen.routeName: ((context) => const ProfileScreen()),
  MyAcc.routeName: ((context) => const MyAcc()),
  Privacy.routeName: ((context) => Body()),
};
