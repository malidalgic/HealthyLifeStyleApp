import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diet/model/dcategoryicon.dart';
import 'package:flutter_app/Screens/Diet/model/diet.dart';
import 'package:flutter_app/Screens/Diet/provider/dcategory_provider.dart';
import 'package:flutter_app/Screens/Diet/provider/diet_provider.dart';
import 'package:flutter_app/Screens/Diet/screens/detailscreen.dart';
import 'package:flutter_app/Screens/Diet/screens/listdiet.dart';
import 'package:flutter_app/Screens/Diet/widgets/singlediet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

late DcategoryProvider dcategoryProvider;
late DietProvider dietProvider;

class _HomePageState extends State<HomePage> {
  Widget _buildDcategoryDiet({required String image, int? color}) {
    return CircleAvatar(
      maxRadius: height * 0.1 / 2.1,
      backgroundColor: Color(color!),
      child: SizedBox(
        height: 40,
        child: SvgPicture.network(image,height: height*0.60,),
      ),
    );
  }

  late double height, width;
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  Widget _buildMediterraneandietIcon() {
    List<DcategoryIcon> mediterraneandietIcon =
        dcategoryProvider.getMediterraneandietIcon;
    List<Diet> mediterraneandiet = dcategoryProvider.getMediterraneandietList;
    return Row(
        children: mediterraneandietIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListDiet(
                name: "Mediterranean diet",
                snapShot: mediterraneandiet,
                isCategory: true,
              ),
            ),
          );
        },
        child: _buildDcategoryDiet(image: e.image, color: 0xff33dcfd),
      );
    }).toList());
  }

  Widget _buildKetodietIcon() {
    List<Diet> ketodiet = dcategoryProvider.getKetodietList;
    List<DcategoryIcon> ketodietIcon = dcategoryProvider.getKetodietIconData;
    return Row(
        children: ketodietIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListDiet(
                name: "keto diet",
                snapShot: ketodiet,
                isCategory: true,
              ),
            ),
          );
        },
        child: _buildDcategoryDiet(image: e.image, color: 0xfff38cdd),
      );
    }).toList());
  }

  Widget _buildPaleodietIcon() {
    List<DcategoryIcon> shoeIcon = dcategoryProvider.getPaleodietIcon;
    List<Diet> paleodiet = dcategoryProvider.getPaleodietList;
    return Row(
        children: shoeIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListDiet(
                name: "paleo diet",
                snapShot: paleodiet,
                isCategory: true,
              ),
            ),
          );
        },
        child: _buildDcategoryDiet(
          image: e.image,
          color: 0xff4ff2af,
        ),
      );
    }).toList());
  }

  Widget _buildAlkalinedietIcon() {
    List<DcategoryIcon> alkalinedietIcon =
        dcategoryProvider.getAlkalinedietIcon;
    List<Diet> alkalinediet = dcategoryProvider.getAlkalinedietList;
    return Row(
        children: alkalinedietIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListDiet(
                name: "alkaline diet",
                snapShot: alkalinediet,
                isCategory: true,
              ),
            ),
          );
        },
        child: _buildDcategoryDiet(
          image: e.image,
          color: 0xff74acf7,
        ),
      );
    }).toList());
  }

  Widget _buildDashdietIcon() {
    List<DcategoryIcon> dashdietIcon = dcategoryProvider.getDashdietIcon;
    List<Diet> dashdiet = dcategoryProvider.getDashdietList;
    return Row(
        children: dashdietIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListDiet(
                name: "dash diet",
                snapShot: dashdiet,
                isCategory: true,
              ),
            ),
          );
        },
        child: _buildDcategoryDiet(
          image: e.image,
          color: 0xfffc6c8d,
        ),
      );
    }).toList());
  }

  Widget _buildDcategory() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: height * 0.1 - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Categories",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              _buildMediterraneandietIcon(),
              _buildKetodietIcon(),
              _buildPaleodietIcon(),
              _buildAlkalinedietIcon(),
              _buildDashdietIcon(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLongterm() {
    List<Diet> longtermDiet;

    longtermDiet = dietProvider.getLongtermList;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Long-term diet plans",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListDiet(
                      name: "Long-term diet plans",
                      isCategory: false,
                      snapShot: longtermDiet,
                    ),
                  ),
                );
              },
              child: const Text(
                "View More",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: dietProvider.getHomeLongtermList.map((e) {
            return Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: e.image,
                              day: e.day.toDouble(),
                              name: e.name,
                            ),
                          ),
                        );
                      },
                      child: SingleDiet(
                        image: e.image,
                        day: e.day.toDouble(),
                        name: e.name,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildShortterm() {
    List<Diet> shorttermDiet = dietProvider.getShorttermList;
    return Column(
      children: <Widget>[
        SizedBox(
          height: height * 0.1 - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Short-term diet plans",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ListDiet(
                            name: "Short-term diet plans",
                            isCategory: false,
                            snapShot: shorttermDiet,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "View more",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
            children: dietProvider.getHomeShorttermList.map((e) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => DetailScreen(
                                      image: e.image,
                                      day: e.day.toDouble(),
                                      name: e.name,
                                    ),
                                  ),
                                );
                              },
                              child: SingleDiet(
                                  image: e.image,
                                  day: e.day.toDouble(),
                                  name: e.name),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }).toList()),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  void getCallAllFunction() {
    dcategoryProvider.getAlkalinedietData();
    dcategoryProvider.getDashdietData();
    dcategoryProvider.getPaleodietData();
    dcategoryProvider.getMediterraneandietData();
    dcategoryProvider.getKetodietData();
    dcategoryProvider.getmediterraneandietIconData();
    dietProvider.getLongtermData();
    dietProvider.getsShorttermData();
    dietProvider.getHomeShorttermData();
    dietProvider.getHomeLongtermData();
    dcategoryProvider.getKetodietIcon();
    dcategoryProvider.getDashdietIconData();
    dcategoryProvider.getAlkalinedietIconData();
    dcategoryProvider.getPaleodietIconData();
  }

  @override
  Widget build(BuildContext context) {
    dcategoryProvider = Provider.of<DcategoryProvider>(context);
    dietProvider = Provider.of<DietProvider>(context);
    getCallAllFunction();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text(
          "Diets",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
     
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildDcategory(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildLongterm(),
                  _buildShortterm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
