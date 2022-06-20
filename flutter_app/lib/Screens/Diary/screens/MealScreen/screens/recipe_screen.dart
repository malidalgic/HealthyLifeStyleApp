import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/equipment_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/ingredients_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/meal_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/recipe_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/recipe_steps.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/screens/detail_screen.dart';

class RecipeScreen extends StatefulWidget {
  final String mealType;
  final Recipe recipe;
  final List<Ingredient> ingredients;
  final List<Equipment> equipments;
  final Meal meal;
  final List<RecipeStepsModel> recipeSteps;

  const RecipeScreen(
      {Key? key,
      required this.meal,
      required this.mealType,
      required this.recipe,
      required this.ingredients,
      required this.equipments,
      required this.recipeSteps})
      : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreen(
          meal: widget.meal,
          ingredients: widget.ingredients,
          equipments: widget.equipments,
          recipe: widget.recipe,
          recipeSteps: widget.recipeSteps),
    );
  }
}
