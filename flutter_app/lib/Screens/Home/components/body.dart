// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Blog/blog_screen.dart';
import 'package:flutter_app/Screens/Diary/diary_screen.dart';
import 'package:flutter_app/Screens/Diet/dietscreen.dart';
import 'package:flutter_app/Screens/Login/login_screen.dart';
import 'package:flutter_app/Screens/Profile/main.dart';
import 'package:flutter_app/Screens/Recipe/recipe_screen.dart';
import 'package:flutter_app/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int index = 0;
   var _isLogged;
  final screens = [
    const DiaryScreen(),
    const RecipeScreen(),
    const DietScreen(),
    const BlogScreen(),
    const ProfilesScreen(),
  ];

  @override
  void initState() {
    
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        _isLogged = false;
      } else {
        _isLogged = true;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _isLogged ? screens[index] : const LoginScreen() ,
        bottomNavigationBar: _isLogged ? NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: kPrimaryColor,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 60,
            backgroundColor: kPrimaryColor,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: index,
            animationDuration: const Duration(seconds: 3),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.menu, color: Colors.white),
                label: 'Diary',
                selectedIcon: Icon(
                  Icons.menu,
                  color: Colors.amber,
                ),
              ),
              NavigationDestination(
                icon: Icon(Icons.restaurant_menu, color: Colors.white),
                label: 'Recipes',
                selectedIcon: Icon(
                  Icons.restaurant_menu,
                  color: Colors.amber,
                ),
              ),
              NavigationDestination(
                icon: Icon(Icons.check_circle, color: Colors.white),
                label: 'Plans',
                selectedIcon: Icon(
                  Icons.check_circle,
                  color: Colors.amber,
                ),
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_book, color: Colors.white),
                label: 'Blog',
                selectedIcon: Icon(
                  Icons.menu_book,
                  color: Colors.amber,
                ),
              ),
              NavigationDestination(
                icon: Icon(Icons.person, color: Colors.white),
                label: 'Profile',
                selectedIcon: Icon(
                  Icons.person,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ): null,
      );
}
