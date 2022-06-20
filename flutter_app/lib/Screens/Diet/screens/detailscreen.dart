import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diet/provider/diet_provider.dart';
import 'package:flutter_app/Screens/Diet/screens/homepage.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double day;
  // ignore: use_key_in_widget_constructors
  const DetailScreen(
      {required this.image, required this.name, required this.day});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  late DietProvider dietProvider;

  final TextStyle myStyle = const TextStyle(
    fontSize: 18,
  );
  Widget _buildImage() {
    return Center(
      child: SizedBox(
        width: 380,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Text(widget.name, style: myStyle),
                      ],
                    ),
                  ),
                  Text(
                    "${widget.day.toString()} Days",
                    style: const TextStyle(
                        color: Color(0xff9b96d6),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Description", style: myStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscription() {
    return SingleChildScrollView(
      child: SizedBox(
        height: 170,
        child: Wrap(
          children: const <Widget>[
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dietProvider = Provider.of<DietProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const HomePage(),
          ),
        );
        return (true);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              const Text("Detail Page", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const HomePage(),
                ),
              );
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            _buildImage(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildNameToDescriptionPart(),
                  _buildDiscription(),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
