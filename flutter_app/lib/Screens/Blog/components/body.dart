import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Blog/components/create_blog.dart';

import 'package:flutter_app/Screens/Blog/components/services.dart';
import 'package:flutter_app/Screens/Blog/components/update_blog.dart';
import 'package:flutter_app/Screens/Diary/diary_screen.dart';

import 'package:flutter_app/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CrudMethods crudMethods = CrudMethods();

  QuerySnapshot? blogSnapshot;

  @override
  void initState() {
    crudMethods.getData().then((result) {
      blogSnapshot = result;
      setState(() {});
    });
    super.initState();
  }

  Widget blogsList() {
    return GestureDetector(
      onDoubleTap: () {
      
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UpdateBlog()));
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 24),
        itemCount: blogSnapshot?.docs.length,
        itemBuilder: (context, index) {
          return BlogTile(
            author: blogSnapshot?.docs[index].get('author'),
            title: blogSnapshot?.docs[index].get('title'),
            desc: blogSnapshot?.docs[index].get('desc'),
            imgUrl: blogSnapshot?.docs[index].get('imgUrl'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 124, 120, 119),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Blog Page",
          style: TextStyle(fontSize: 24, color: kPrimaryLightColor),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DiaryScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          )
        ],
      ),
      body: Container(
          child: blogSnapshot != null
              ? blogsList()
              : const Center(
                  child: CircularProgressIndicator(),
                )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateBlog()));
        },
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl, title, desc, author;
  const BlogTile(
      {Key? key,
      required this.author,
      required this.desc,
      required this.imgUrl,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              imgUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 2),
          Text(
            desc,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            'Author - $author',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 24, right: 16, left: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: kPrimaryColor, width: 3.0, style: BorderStyle.solid),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: kPrimaryLightColor,
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.transparent,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
    );

    /*
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 24, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              imgUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 2),
          Text(
            desc,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            'Author - $author',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );*/
  }
}
