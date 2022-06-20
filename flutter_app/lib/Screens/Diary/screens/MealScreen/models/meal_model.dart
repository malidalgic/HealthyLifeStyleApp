class Meal {
  late int id;
  late String imageType;
  late String title;
 late int readyInMinutes;
 late int servings;
 late String sourceUrl;

  Meal(
      {required this.id,
      required this.imageType,
      required this.title,
      required this.readyInMinutes,
      required this.servings,
      required this.sourceUrl});

  Meal.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    imageType = json['imageType'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
  }
}