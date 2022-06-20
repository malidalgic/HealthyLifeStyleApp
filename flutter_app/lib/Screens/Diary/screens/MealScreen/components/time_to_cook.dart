// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class TimeToCook extends StatelessWidget {
  final Recipe recipe;
  const TimeToCook(this.recipe);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      // ignore: deprecated_member_use
      child: FlatButton.icon(
        color: Colors.orange,
        onPressed: () {
          // Navigator.of(context)
          //  .pushNamed(RecipeList.routeName, arguments: recipe.id);
        },
        icon: const Icon(Icons.arrow_forward),
        label: const Text('Start Cooking'),
      ),
    );
  }
}
