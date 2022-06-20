import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/meal_model.dart';




class NameandRating extends StatefulWidget {
  const NameandRating({
    Key? key,
    required this.meal,
    required this.size,
  }) : super(key: key);

  //final Movie movie;
  final Meal meal;
 final Size size;
  @override
  _NameandRatingState createState() => _NameandRatingState();
}

class _NameandRatingState extends State<NameandRating> {
  //bool _isFavourite=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20, right:20,bottom: 0,top: 10 ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: <Widget>[
                Text(
                  widget.meal.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                //SizedBox(height: widget.size.height ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
