import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);
  static String routeName = '/profile';

  @override
  _PrivacyState createState() => _PrivacyState();
}

@override
class _PrivacyState extends State<Privacy> {
  final TextEditingController _passwordController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection("user");

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Update Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 200),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  //icon: Icon(Icons.email),
                  hintText: 'Enter your new password',
                  labelText: 'New Password'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: const Text("Update"),
                //color: kPrimaryColor,
                onPressed: () async {
                  {
                    await FirebaseFirestore.instance
                        .collection('user')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({'password': _passwordController.text});
                  }
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
