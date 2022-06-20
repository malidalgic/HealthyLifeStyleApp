// ignore_for_file: unused_local_variable, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? selectedImage;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          selectedImage = File(pickedFile.path);
        } else {
          Fluttertoast.showToast(msg: "No image selected");
        }
      });
    }

    Future uploadPic(BuildContext context) async {
      String filName = basename(selectedImage!.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(filName);
      UploadTask uploadTask = ref.putFile(selectedImage!);
      TaskSnapshot taskSnapshot = await uploadTask;
      setState(() {
        // ignore: avoid_print
        print("Profile picture uploadoed");
        Scaffold.of(context)
            // ignore: deprecated_member_use
            .showSnackBar(
                const SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            child: (selectedImage != null)
                ? Image.file(selectedImage!, fit: BoxFit.fill)
                : Image.asset("assets/images/profile.png"),
          ),
          Positioned(
              bottom: 0,
              right: -12,
              child: SizedBox(
                height: 46,
                width: 46,
                // ignore: deprecated_member_use
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  color: const Color(0xFFF5F6F9),
                  onPressed: () {
                    getImage();
                  },
                  child: SvgPicture.asset("assets/icons/camera.svg"),
                ),
              ))
        ],
      ),
    );

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // ignore: deprecated_member_use
        RaisedButton(
          color: const Color(0xff476cfb),
          onPressed: () {
            Navigator.of(context).pop();
          },
          elevation: 4.0,
          splashColor: Colors.blueGrey,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        // ignore: deprecated_member_use
        RaisedButton(
          color: const Color(0xff476cfb),
          onPressed: () {
            uploadPic(context);
          },
          elevation: 4.0,
          splashColor: Colors.blueGrey,
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
