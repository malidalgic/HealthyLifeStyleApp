// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/recipe_step_card.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/recipe_steps.dart';



class RecipeSteps extends StatelessWidget {
  final List<RecipeStepsModel> recipeSteps;

  const RecipeSteps(this.recipeSteps);
  @override
  Widget build(BuildContext context) {
    
        return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Steps",
            style: Theme.of(context).textTheme.headline5,
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
            //  physics: NeverScrollableScrollPhysics(),
              itemCount: recipeSteps.length,
              itemBuilder: (context, index) => RecipeCard(recipeSteps[index].step, recipeSteps[index].number),
            ),
          )
        ],
      ),
    );
      
  }
}
