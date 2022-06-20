import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/components/equipment_card.dart';
import 'package:flutter_app/Screens/Diary/screens/MealScreen/models/equipment_model.dart';





class Equipments extends StatelessWidget {
  final List<Equipment> equipments;

  const Equipments({Key? key, required this.equipments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  print(ingredient[1].orginalName);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Equipments",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: equipments.length,
              itemBuilder: (context, index) => EquipmentCard(equipment: equipments[index]),
            ),
          )
        ],
      ),
    );
  }
}
