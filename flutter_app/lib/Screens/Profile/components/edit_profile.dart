
/*


import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:flutter_app/Screens/Blog/components/services.dart';
import 'user.dart';
import 'package:flutter_app/Screens/Profile/components/user.dart';



/*import 'package:fluttershare/pages/home.dart';
import 'package:fluttershare/widgets/progress.dart';*/

class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final infoController = TextEditingController();
  CollectionReference userDetails= FirebaseFirestore.instance.collection("user details");

 
  get age => null;
  get fullName => null;
  get height => null;
  get weight => null;
  

  @override
  Widget build(BuildContext context) {


     Future<void> updateUser(context) async {
       
      return userDetails
      .doc()
      .update({'fullName': fullName, "age": age, "weight": weight, "height":height})
      .then((value)=> print("User Updated")
      
      
    );
  }
  }
}
*/