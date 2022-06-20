import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/BMI_Calculator/screens/input_page.dart';
import 'package:flutter_app/Screens/Diary/screens/Diary_Home/constants.dart';
import 'package:flutter_app/Screens/Diary/screens/Diary_Home/pages/details_screen.dart';
import 'package:flutter_app/Screens/Diary/screens/Diary_Home/widgets/category_card.dart';
import 'package:flutter_app/Screens/Diary/screens/Diet_Tips/diet_tips.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/screens/search_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "WELCOME",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Calculators",
                          svgSrc: "assets/images/bmi.png",
                          press: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return  const InputPage();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Meals",
                          svgSrc: "assets/images/meal.png",
                          press: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const SearchScreen();
                              }),
                            );

                          },
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/images/meditation.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Diet Tips",
                          svgSrc: "assets/images/tips.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return  const DietTips();
                              }),
                            );
                          },
                          
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
