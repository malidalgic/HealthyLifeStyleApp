import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/backdrop.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/equipments.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/ingredients.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/name_rating.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/recipe_steps.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/equipment_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/ingredients_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/meal_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/recipe_model.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/recipe_steps.dart';



class DetailScreen extends StatefulWidget {
  //static const routeName = '/detail-screen';
  final Meal meal;
  final List<Ingredient> ingredients;
  final List<Equipment> equipments;
  final List<RecipeStepsModel> recipeSteps;
  final Recipe recipe;

  const DetailScreen(
      {Key? key, required this.meal,
      required this.ingredients,
      required this.equipments,
      required this.recipe,
      required this.recipeSteps}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String image = 'https://spoonacular.com/recipeImages/' +
        widget.meal.id.toString() +
        '-556x370.' +
        widget.meal.imageType;
    // final recipeId =
    //     ModalRoute.of(context).settings.arguments as String; // is the id!
    return Scaffold(
      body: SingleChildScrollView(
          child:SizedBox(
              height: size.height*1.5, 
              width: size.width * 1.5,
              child: Column(children: [
                Backdrop(
                  size: size,
                  image: image,
                  id: widget.meal.id.toString(),
                  serves: widget.meal.servings.toString(),
                  minutes: widget.meal.readyInMinutes.toString(),
                ),
                NameandRating(size: size, meal: widget.meal),
                Ingredients(ingredient: widget.ingredients),
                Equipments(
                  equipments: widget.equipments,
                ),
                Expanded(child: RecipeSteps(widget.recipeSteps)),
              ]))
     
          ),
    );
  }
}
