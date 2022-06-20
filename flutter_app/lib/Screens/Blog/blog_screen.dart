import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Blog/components/body.dart';


class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Body(),
    );
  }
}
