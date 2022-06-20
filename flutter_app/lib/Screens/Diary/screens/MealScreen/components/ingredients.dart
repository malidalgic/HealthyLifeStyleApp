import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/ingredient_card.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/ingredients_model.dart';




class Ingredients extends StatelessWidget {
  final List<Ingredient> ingredient;

  const Ingredients({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  print(ingredient[1].orginalName);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 105,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ingredient.length,
              itemBuilder: (context, index) => IngredientCard(ingredient: ingredient[index]),
            ),
          )
        ],
      ),
    );
  }
}
