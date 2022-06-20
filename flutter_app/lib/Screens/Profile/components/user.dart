import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  
  final String fullName;
  final int height;
  final int weight;
  final int age;


  User({
    
    required this.fullName,
    required this.height,
    required this.weight,
    required this.age,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      fullName: doc['fullName'],
      height: doc['height'],
      weight: doc['weight'],
      age: doc['age'],
     
    );
  }
}