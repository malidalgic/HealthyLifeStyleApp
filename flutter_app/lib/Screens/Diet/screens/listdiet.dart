

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diet/model/diet.dart';
import 'package:flutter_app/Screens/Diet/provider/dcategory_provider.dart';
import 'package:flutter_app/Screens/Diet/provider/diet_provider.dart';
import 'package:flutter_app/Screens/Diet/screens/detailscreen.dart';
import 'package:flutter_app/Screens/Diet/screens/homepage.dart';
import 'package:flutter_app/Screens/Diet/screens/search_dcategory.dart';
import 'package:flutter_app/Screens/Diet/screens/search_diet.dart';
import 'package:flutter_app/Screens/Diet/widgets/singlediet.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListDiet extends StatelessWidget {
  late final String name;
  bool isCategory = true;
  late final List<Diet> snapShot;
  ListDiet({Key? key, 
    required this.name,
    required this.isCategory,
    required this.snapShot,
  }) : super(key: key);

  Widget _buildTopName() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMyGridView(context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return SizedBox(
      height: 700,
      child: GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: orientation == Orientation.portrait ? 0.8 : 0.9,
        scrollDirection: Axis.vertical,
        children: snapShot
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                            image: e.image,
                            name: e.name,
                            day: e.day.toDouble(),
                          )));
                },
                child: SingleDiet(
                  day: e.day.toDouble(),
                  image: e.image,
                  name: e.name,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  late DcategoryProvider dcategoryProvider;
  late DietProvider dietProvider;
  Widget _buildSearchBar(context) {
    return isCategory == true
        ? IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              dcategoryProvider.getSearchList(list: snapShot);
              showSearch(context: context, delegate: SearchDcategory());
            },
          )
        : IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
            dietProvider.getSearchList(list: snapShot);
              showSearch(context: context, delegate: SearchDiet());
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    dcategoryProvider = Provider.of<DcategoryProvider>(context);
    dietProvider = Provider.of<DietProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const HomePage(),
                ),
              );
            }),
        actions: <Widget>[
          _buildSearchBar(context),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            _buildTopName(),
            const SizedBox(
              height: 10,
            ),
            _buildMyGridView(context),
          ],
        ),
      ),
    );
  }
}