import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login/login_screen.dart';
import 'package:flutter_app/Screens/Signup/components/background.dart';
import 'package:flutter_app/Screens/Signup/components/create_person.dart';
import 'package:flutter_app/Screens/Signup/components/or_divider.dart';
import 'package:flutter_app/Screens/Signup/components/social_icon.dart';
import 'package:flutter_app/Service/auth.dart';
import 'package:flutter_app/components/already_have_an_account_acheck.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/components/text_field_container.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  final Widget child;

  const Body({Key? key, required this.child}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool showSpinner = false;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/dosya3.svg",
              height: size.height * 0.35,
            ),
            TextFieldContainer(
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: "Your E-mail",
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                obscureText: _isHidden,
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Your Password",
                  icon: const Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: IconButton(
                    color: kPrimaryColor,
                    icon: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() => _isHidden = !_isHidden);
                    },
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () async {
                setState(() {
                  showSpinner = true;
                });

                try {
                  final user = await _authService.createUser(
                      _emailController.text, _passwordController.text);
                  if (user != null) {
                    await _authService.signIn(
                        _emailController.text, _passwordController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreatePerson()));
                  }
                } catch (e) {
                  Fluttertoast.showToast(msg: "$e");
                }
                setState(() {
                  showSpinner = false;
                });
              },
            ),
            SizedBox(
              height: size.height * 0.003,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/cukurova.svg",
                  press: () async {
                    final Uri _url =
                        Uri.parse('https://avesis.cu.edu.tr/saozel');
                    if (!await launchUrl(_url)) {
                      throw Fluttertoast.showToast(
                          msg: "Could not Launch $_url");
                    }
                  },
                ),
                SocialIcon(
                  iconSrc: "assets/icons/linkedln.svg",
                  press: () async {
                    final Uri _url =
                        Uri.parse('https://www.linkedin.com/in/malidalgic/');
                    if (!await launchUrl(_url)) {
                      throw Fluttertoast.showToast(
                          msg: "Could not Launch $_url");
                    }
                  },
                ),
                SocialIcon(
                  iconSrc: "assets/icons/linkedln.svg",
                  press: () async {
                    final Uri _url = Uri.parse(
                        'https://www.linkedin.com/in/zeynep-erdem-44079a186/');
                    if (!await launchUrl(_url)) {
                      throw Fluttertoast.showToast(
                          msg: "Could not Launch $_url");
                    }
                  },
                ),
                SocialIcon(
                  iconSrc: "assets/icons/linkedln.svg",
                  press: () async {
                    final Uri _url =
                        Uri.parse('https://www.linkedin.com/in/sumeyracam/');
                    if (!await launchUrl(_url)) {
                      throw Fluttertoast.showToast(
                          msg: "Could not Launch $_url");
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
