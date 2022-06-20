import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diet/provider/dcategory_provider.dart';
import 'package:flutter_app/Screens/Diet/provider/diet_provider.dart';
import 'package:flutter_app/Screens/Diet/screens/homepage.dart';
import 'package:provider/provider.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DcategoryProvider>(
          create: (context) => DcategoryProvider(),
        ),
        ChangeNotifierProvider<DietProvider>(
          create: (context) => DietProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff746bc9),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return const HomePage();
          },
        ),
      ),
    );
  }
}
