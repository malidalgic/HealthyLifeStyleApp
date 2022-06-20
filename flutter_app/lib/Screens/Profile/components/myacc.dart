import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Screens/Profile/components/profile_update_screen.dart';
import 'package:flutter_app/constants.dart';


class MyAcc extends StatefulWidget {
  static const routeName = "/profile";

  const MyAcc({Key? key}) : super(key: key);

  @override
   _MyAccState createState() => _MyAccState();
}

class _MyAccState extends State< MyAcc> {
  bool _isLoading = false;
  late var userPersonalData = {};

  getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var userDataSnap = await FirebaseFirestore.instance
          .collection('user details')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .get();
          
      userPersonalData = userDataSnap.data()!;
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Profile'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
                backgroundColor: Colors.grey,
                strokeWidth: 10,
              ),
            )
          : SafeArea(
              child: Column(
              children: [
                //for circle avtar image
               
                const SizedBox(
                  height: 10,
                ),
                _profileName(userPersonalData['fullName'].toString()),
                const SizedBox(
                  height: 14,
                ),
                _heading("Personal Details"),
                const SizedBox(
                  height: 6,
                ),
                _detailsCard(),
                const SizedBox(
                  height: 10,
                ),
                _heading("Settings"),
                const SizedBox(
                  height: 6,
                ),
                _settingsCard(),
                const Spacer(),
              ],
            )),
    );
  }


  Widget _profileName(String name) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.80, //80% of width,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(userPersonalData['fullName'].toString()),
            ),
            const Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: Text(userPersonalData['age'].toString()),
            ),
            const Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: const Icon(Icons.monitor_weight),
              title: Text(userPersonalData['weight'].toString()),
            ),
            const Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: const Icon(Icons.height_rounded),
              title: Text(userPersonalData['height'].toString()),
            ),
            const Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Update Profile Info"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileUpdateScreen();
                }));
              },
            ),
            const Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
