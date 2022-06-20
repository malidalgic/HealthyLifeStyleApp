
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diet/model/diet.dart';

class DietProvider with ChangeNotifier {
  List<Diet> longterm = [];
  late Diet longtermData;

  Future<void> getLongtermData() async {
    List<Diet> newList = [];
    QuerySnapshot longtermSnapShot = await FirebaseFirestore.instance
        .collection("diets")
        .doc("eeGgFv0OJp68fi2HV3oE")
        .collection("longtermplans")
        .get();

    for (var element in longtermSnapShot.docs) {
      longtermData = Diet(
          image: element["image"], name: element["name"], day: element["day"]);
      newList.add(longtermData);
    }
    longterm = newList;
    notifyListeners();
  }

  List<Diet> get getLongtermList {
    return longterm;
  }

  List<Diet> homeLongterm = [];

  Future<void> getHomeLongtermData() async {
    List<Diet> newList = [];
    QuerySnapshot longtermSnapShot =
        await FirebaseFirestore.instance.collection("homelongterm").get();
    for (var element in longtermSnapShot.docs) {
      longtermData = Diet(
          image: element["image"], name: element["name"], day: element["day"]);
      newList.add(longtermData);
    }
    homeLongterm = newList;
    notifyListeners();
  }

  List<Diet> get getHomeLongtermList {
    return homeLongterm;
  }

  List<Diet> homeShortterm = [];

  Future<void> getHomeShorttermData() async {
    List<Diet> newList = [];
    QuerySnapshot longtermSnapShot =
        await FirebaseFirestore.instance.collection("homeshortterm").get();
    for (var element in longtermSnapShot.docs) {
      longtermData = Diet(
        image: element["image"],
        name: element["name"],
        day: element["day"],
      );
      newList.add(longtermData);
    }
    homeShortterm = newList;
    notifyListeners();
  }

  List<Diet> get getHomeShorttermList {
    return homeShortterm;
  }

  List<Diet> shortterm = [];
  late Diet shorttermData;
  Future<void> getsShorttermData() async {
    List<Diet> newList = [];
    QuerySnapshot shorttermSnapShot = await FirebaseFirestore.instance
        .collection("diets")
        .doc("eeGgFv0OJp68fi2HV3oE")
        .collection("shorttermplans")
        .get();
    for (var element in shorttermSnapShot.docs) {
      shorttermData = Diet(
          image: element["image"], name: element["name"], day: element["day"]);
      newList.add(shorttermData);
    }
    shortterm = newList;
    notifyListeners();
  }

  List<Diet> get getShorttermList {
    return shortterm;
  }

  late List<Diet> searchList;
  void getSearchList({required List<Diet> list}) {
    searchList = list;
  }

  List<Diet> searchDietList(String query) {
    List<Diet> searchKetodiet = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchKetodiet;
  }
}
