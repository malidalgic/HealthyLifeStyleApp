import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/Diary_Home/constants.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
         appBar: AppBar(
          title: const Text("Meditations"),
          elevation: 0,
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              Navigator.pop(context);
              },
            color: Colors.black,
          ),
        ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const Text(
                      "Meditation",
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: const Text(
                        "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                      ),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 1,
                          isDone: true,
                          press: () async {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/watch?v=O-6f5wQXSu8&list=PLQiGxGHwiuD1kdxsWKFuhE0rITIXe-7yC');
                            if (!await launchUrl(_url)) {
                              throw Fluttertoast.showToast(
                                  msg: "Could not Launch $_url");
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 2,
                          press: () async {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/watch?v=inpok4MKVLM&list=PLQiGxGHwiuD1kdxsWKFuhE0rITIXe-7yC&index=2');
                            if (!await launchUrl(_url)) {
                              throw Fluttertoast.showToast(
                                  msg: "Could not Launch $_url");
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 3,
                          press: () async {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/watch?v=aEqlQvczMJQ&list=PLQiGxGHwiuD1kdxsWKFuhE0rITIXe-7yC&index=4');
                            if (!await launchUrl(_url)) {
                              throw Fluttertoast.showToast(
                                  msg: "Could not Launch $_url");
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 4,
                          press: () async {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/watch?v=z6X5oEIg6Ak&list=PLQiGxGHwiuD1kdxsWKFuhE0rITIXe-7yC&index=6');
                            if (!await launchUrl(_url)) {
                              throw Fluttertoast.showToast(
                                  msg: "Could not Launch $_url");
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 5,
                          press: () async {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/watch?v=ENYYb5vIMkU&list=PLQiGxGHwiuD1kdxsWKFuhE0rITIXe-7yC&index=7');
                            if (!await launchUrl(_url)) {
                              throw Fluttertoast.showToast(
                                  msg: "Could not Launch $_url");
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 6,
                          press: () async {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/watch?v=xRxT9cOKiM8&list=PLQiGxGHwiuD1kdxsWKFuhE0rITIXe-7yC&index=12');
                            if (!await launchUrl(_url)) {
                              throw Fluttertoast.showToast(
                                  msg: "Could not Launch $_url");
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Meditation",
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg",
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  "Basic 2",
                                ),
                                Text("Start your deepen you practice")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final VoidCallback press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
