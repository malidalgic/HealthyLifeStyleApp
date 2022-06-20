import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/ingredients_model.dart';




class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;

  // ignore: use_key_in_widget_constructors
  const IngredientCard({Key? key, required this.ingredient});
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://spoonacular.com/cdn/ingredients_100x100/'+ingredient.image,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10 / 2),
          Text(
            ingredient.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          const SizedBox(height: 10 / 4),
          Text(
            ingredient.amount,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
