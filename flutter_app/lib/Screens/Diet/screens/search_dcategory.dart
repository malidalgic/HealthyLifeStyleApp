
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Diet/model/diet.dart';
import 'package:flutter_app/Screens/Diet/provider/dcategory_provider.dart';
import 'package:flutter_app/Screens/Diet/screens/detailscreen.dart';
import 'package:flutter_app/Screens/Diet/widgets/singlediet.dart';
import 'package:provider/provider.dart';

class SearchDcategory extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    DcategoryProvider dcategoryProvider = Provider.of<DcategoryProvider>(context);
    List<Diet> searchDcategory = dcategoryProvider.searchDcategoryList(query);

    return GridView.count(
        childAspectRatio: 0.76,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: searchDcategory
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          image: e.image,
                          name: e.name,
                          day: e.day.toDouble(),
                        ),
                      ),
                    );
                  },
                  child: SingleDiet(
                    image: e.image,
                    name: e.name,
                    day: e.day.toDouble(),
                  ),
                ))
            .toList());
  }

  void getDiet() {}
  @override
  Widget buildSuggestions(BuildContext context) {
    DcategoryProvider dcategoryProvider = Provider.of<DcategoryProvider>(context);
    List<Diet> searchDcategory = dcategoryProvider.searchDcategoryList(query);
    return GridView.count(
        childAspectRatio: 0.87,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: searchDcategory
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          image: e.image,
                          name: e.name,
                          day: e.day.toDouble(),
                        ),
                      ),
                    );
                  },
                  child: SingleDiet(
                    image: e.image,
                    name: e.name,
                    day: e.day.toDouble(),
                  ),
                ))
            .toList());
  }
}