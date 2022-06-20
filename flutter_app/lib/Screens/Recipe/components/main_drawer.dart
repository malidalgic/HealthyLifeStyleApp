import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Recipe/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Theme.of(context).colorScheme.secondary,
          alignment: Alignment.bottomCenter,
          child: const Text(
            'Let\'s Cook?',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: const Text(
            'Recipes',
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
        ),
        ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: const Text(
              'Configurations',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)),
      ]),
    );
  }
}
