import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login/login_screen.dart';
import 'package:flutter_app/Screens/Profile/components/myacc.dart';
import 'package:flutter_app/Service/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 40),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            icon: "assets/icons/user.svg",
            text: "My Account",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyAcc()));
            },
          ),
          /*ProfileMenu(
            icon: "assets/icons/privacy.svg",
            text: "Privacy",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Privacy()));
            },
          ),*/
          ProfileMenu(
            icon: "assets/icons/logout.svg",
            text: "Log out",
            press: () async {
              await _authService.signOut();

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: Colors.purple,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
