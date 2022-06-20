import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diet/model/dcategoryicon.dart';
import 'package:flutter_app/Screens/Diet/model/diet.dart';

class DcategoryProvider with ChangeNotifier {
  List<Diet> ketodiet = [];
  late Diet ketodietData;
  List<Diet> mediterraneandiet = [];
  late Diet mediterraneandietData;
  List<Diet> paleodiet = [];
  late Diet paleodietData;
  List<Diet> alkalinediet = [];
  late Diet alkalinedietData;
  List<Diet> dashdiet = [];
  late Diet dashdietData;
  List<DcategoryIcon> mediterraneandietIcon = [];
  late DcategoryIcon mediterraneandieticonData;

  Future<void> getmediterraneandietIconData() async {
    List<DcategoryIcon> newList = [];
    QuerySnapshot mediterraneandietSnapShot = await FirebaseFirestore.instance
        .collection("dcategoryicon")
        .doc("sJVpGZpm3kdadqecF05i")
        .collection("mediterraneandiet")
        .get();
    for (var element in mediterraneandietSnapShot.docs) {
        mediterraneandieticonData = DcategoryIcon(image: element["image"]);
        newList.add(mediterraneandieticonData);
      }
   mediterraneandietIcon = newList;
    notifyListeners();
  }

  List<DcategoryIcon> get getMediterraneandietIcon {
    return mediterraneandietIcon;
  }

  List<DcategoryIcon> ketodietIcon = [];
  late DcategoryIcon ketodieticonData;
  Future<void> getKetodietIcon() async {
    List<DcategoryIcon> newList = [];
    QuerySnapshot ketodietSnapShot = await FirebaseFirestore.instance
        .collection("dcategoryicon")
        .doc("sJVpGZpm3kdadqecF05i")
        .collection("ketodiet")
        .get();
    for (var element in ketodietSnapShot.docs) {
        ketodieticonData = DcategoryIcon(image: element["image"]);
        newList.add(ketodieticonData);
      }
    ketodietIcon = newList;
    notifyListeners();
  }

  List<DcategoryIcon> get getKetodietIconData {
    return ketodietIcon;
  }

  List<DcategoryIcon> paleodietIcon = [];
  late DcategoryIcon paleodietIconData;
  Future<void> getPaleodietIconData() async {
    List<DcategoryIcon> newList = [];
    QuerySnapshot paleodietSnapShot = await FirebaseFirestore.instance
         .collection("dcategoryicon")
        .doc("sJVpGZpm3kdadqecF05i")
        .collection("paleodiet")
        .get();
    for (var element in paleodietSnapShot.docs) {
        paleodietIconData = DcategoryIcon(image: element["image"]);
        newList.add(paleodietIconData);
      }
    paleodietIcon = newList;
    notifyListeners();
  }

  List<DcategoryIcon> get getPaleodietIcon {
    return paleodietIcon;
  }

  List<DcategoryIcon> alkalinedietIcon = [];
  late DcategoryIcon alkalinedieticonData;
  Future<void> getAlkalinedietIconData() async {
    List<DcategoryIcon> newList = [];
    QuerySnapshot alkalinedietSnapShot = await FirebaseFirestore.instance
       .collection("dcategoryicon")
        .doc("sJVpGZpm3kdadqecF05i")
        .collection("alkalinediet")
        .get();
   for (var element in alkalinedietSnapShot.docs) {
        alkalinedieticonData = DcategoryIcon(image: element["image"]);
        newList.add(alkalinedieticonData);
      }
    alkalinedietIcon = newList;
    notifyListeners();
  }

  List<DcategoryIcon> get getAlkalinedietIcon {
    return alkalinedietIcon;
  }

  List<DcategoryIcon> dashdietIcon = [];
  late DcategoryIcon dashdietIconData;
  Future<void> getDashdietIconData() async {
    List<DcategoryIcon> newList = [];
    QuerySnapshot dashdietSnapShot = await FirebaseFirestore.instance
       .collection("dcategoryicon")
        .doc("sJVpGZpm3kdadqecF05i")
        .collection("dashdiet")
        .get();
    for (var element in dashdietSnapShot.docs) {
        dashdietIconData = DcategoryIcon(image: element["image"]);
        newList.add(dashdietIconData);
      }
    dashdietIcon = newList;
    notifyListeners();
  }

  List<DcategoryIcon> get getDashdietIcon {
    return dashdietIcon;
  }

  Future<void> getKetodietData() async {
    List<Diet> newList = [];
    QuerySnapshot ketodietSnapShot = await FirebaseFirestore.instance
        .collection("dcategory")
        .doc("jtHLmvYWbBA9CnHEcY77")
        .collection("ketodiet")
        .get();
    for (var element in ketodietSnapShot.docs) {
       ketodietData = Diet(
            image: element["image"],
            name: element["name"],
            day: element["day"]);
        newList.add(ketodietData);
      }
    ketodiet = newList;
    notifyListeners();
  }

  List<Diet> get getKetodietList {
    return ketodiet;
  }

  Future<void> getMediterraneandietData() async {
    List<Diet> newList = [];
    QuerySnapshot ketodietSnapShot = await FirebaseFirestore.instance
       .collection("dcategory")
        .doc("jtHLmvYWbBA9CnHEcY77")
        .collection("mediterraneandiet")
        .get();
   for (var element in ketodietSnapShot.docs) {
        mediterraneandietData = Diet(
            image: element["image"],
            name: element["name"],
           day: element["day"]);
        newList.add(mediterraneandietData);
      }
    mediterraneandiet = newList;
    notifyListeners();
  }

  List<Diet> get getMediterraneandietList {
    return mediterraneandiet;
  }

  Future<void> getPaleodietData() async {
    List<Diet> newList = [];
    QuerySnapshot ketodietSnapShot = await FirebaseFirestore.instance
        .collection("dcategory")
        .doc("jtHLmvYWbBA9CnHEcY77")
        .collection("paleodiet")
        .get();
    for (var element in ketodietSnapShot.docs) {
       paleodietData = Diet(
            image: element["image"],
            name: element["name"],
            day: element["day"]);
        newList.add(paleodietData);
      }
    paleodiet = newList;
    notifyListeners();
  }

  List<Diet> get getPaleodietList {
    return paleodiet;
  }

  Future<void> getAlkalinedietData() async {
    List<Diet> newList = [];
    QuerySnapshot ketodietSnapShot = await FirebaseFirestore.instance
       .collection("dcategory")
        .doc("jtHLmvYWbBA9CnHEcY77")
        .collection("alkalinediet")
        .get();
    for (var element in ketodietSnapShot.docs) {
       alkalinedietData = Diet(
            image: element["image"],
            name: element["name"],
            day: element["day"]);
        newList.add(alkalinedietData);
      }
    alkalinediet = newList;
    notifyListeners();
  }

  List<Diet> get getAlkalinedietList {
    return alkalinediet;
  }

  Future<void> getDashdietData() async {
    List<Diet> newList = [];
    QuerySnapshot ketodietSnapShot = await FirebaseFirestore.instance
       .collection("dcategory")
        .doc("jtHLmvYWbBA9CnHEcY77")
        .collection("dashdiet")
        .get();
   for (var element in ketodietSnapShot.docs) {
        dashdietData = Diet(
            image: element["image"],
            name: element["name"],
            day: element["day"]);
        newList.add(dashdietData);
      }
    dashdiet = newList;
    notifyListeners();
  }

  List<Diet> get getDashdietList {
    return dashdiet;
  }

  late List<Diet> searchList;
  void getSearchList({required List<Diet> list}) {
    searchList = list;
  }

  List<Diet> searchDcategoryList(String query) {
    List<Diet> searchShirt = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchShirt;
  }
}