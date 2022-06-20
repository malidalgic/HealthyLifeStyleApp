import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';


class Backdrop extends StatelessWidget {
  const Backdrop({
    Key? key,
    required this.size,
    required this.image,
    required this.id,
    required this.minutes,
    required this.serves,
  }) : super(key: key);

  final Size size;
  final String id;
  final String minutes;
  final String serves;
final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2.7,
      width:size.width,
      decoration:BoxDecoration(
        image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
        color:Colors.black12,
        backgroundBlendMode: BlendMode.darken,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
      ),
      child: Stack(
        children: <Widget>[
          
          Container(
            margin: EdgeInsets.only(top: size.height/3.5),
            height:size.height/4,
            width:size.width,
            decoration: const BoxDecoration(color: Colors.black87,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
            ),
            padding: const EdgeInsets.only(left: 40,right:40, bottom: 10),
            alignment: Alignment.bottomCenter,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom:8,right:5),
              child: Text('Preparation Time: ' +minutes+' min', style: const TextStyle(
                backgroundColor: Colors.black12,
                fontSize: 15,
                color:Colors.white,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom:8,left:5),
              child: Text('Served for: '+serves ,style: const TextStyle(
                backgroundColor: Colors.black12,
                fontSize: 15,
                color:Colors.white,
              ),),
            ),
          ],)),
          // Back Button
          const SafeArea(
            child: BackButton(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}