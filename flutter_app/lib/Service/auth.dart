import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: "No user found for that email.",
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "Wrong password provided for that user.",
        );
      } else {
        Fluttertoast.showToast(msg: "Incorrect Login Try Again");
      }
    }
    return user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createUser(
    String email,
    String password,
  ) async {
    User? user;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      await _firestore.collection("user").doc(user!.uid).set({
        'email': email,
        'password': password,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: "The account already exists for that email.",
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
      );
    }

    return user;
  }

  Future<User?> createPerson(String fullName, String age, String height,
      String weight, String gender) async {
    try {
      User? user = _auth.currentUser;

      await _firestore.collection("user details").doc(user!.uid).set({
        'fullName': fullName,
        'age': age,
        'height': height,
        'weight': weight,
        'gender': gender
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
      );
    }
    return null;
  }

  getUserData() async {
    try {
      User? user = _auth.currentUser;

      await _firestore.collection("user details").doc(user!.uid).get();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
      );
    }
    return;
  }
}
