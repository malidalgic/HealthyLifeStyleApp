import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CrudMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addData(blogData) async {
    //print(blogData);
    FirebaseFirestore.instance
        .collection("blogs")
        .add(blogData)
        .catchError((e) {
      Fluttertoast.showToast(msg: "$e");
    });
  }

  Future<void> changeData(blogData) async {
    FirebaseFirestore.instance
        .collection("blogs")
        .doc('8BFAp8bkmtAMp5YhBX8P')
        .update(blogData)
        .catchError((e) {
      Fluttertoast.showToast(msg: "$e");
    });
  }

  getData() async {
    return _firestore.collection("blogs").get();
  }
}
