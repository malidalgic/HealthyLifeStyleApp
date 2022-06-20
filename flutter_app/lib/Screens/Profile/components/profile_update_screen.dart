import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  CollectionReference ref =
      FirebaseFirestore.instance.collection('user details');

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Update Profile Info"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                children: [
                  TextFormField(
                    controller: _fullNameController,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        hintText: 'Enter your  name',
                        labelText: ' Name'),
                  ),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        hintText: 'Enter your age',
                        labelText: 'Age'),
                  ),
                  TextFormField(
                    controller: _heightController,
                    decoration: const InputDecoration(
                        //icon: Icon(Icons.email),
                        hintText: 'Enter your height',
                        labelText: 'Height'),
                  ),
                  TextFormField(
                    controller: _weightController,
                    decoration: const InputDecoration(
                        //icon: Icon(Icons.phone),
                        hintText: 'Enter your weight',
                        labelText: 'Weight'),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryColor)),
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('user details')
                                  .doc(FirebaseAuth.instance.currentUser!.uid
                                      .toString())
                                  .set({
                                'fullName': _fullNameController.text,
                                'age': _ageController.text,
                                'weight': _weightController.text,
                                'height': _heightController.text,
                              });
                              _fullNameController.clear();
                              _ageController.clear();
                              _weightController.clear();
                              _heightController.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
