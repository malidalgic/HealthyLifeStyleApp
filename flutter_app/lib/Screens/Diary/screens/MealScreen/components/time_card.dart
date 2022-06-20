import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final int servings;
  final int minutes;

  const TimeCard(this.servings, this.minutes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Card(
                  child: Container(
            width: 140,
            color: Colors.lightGreen,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Preparation Time',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      minutes.toString() + ' min',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ]),
            ),
          ),
        ),
        Card(
                  child: Container(
            //decoration: ,
              width: 140,
            color: Colors.lightGreen,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Served For',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      servings == 1? servings.toString() +' person': servings.toString()+' people',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
