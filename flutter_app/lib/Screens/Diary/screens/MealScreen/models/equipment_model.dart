class Equipment {
  final String name;
  final String image;


  Equipment({required this.name, required this.image});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      name: json['name'],
      image: json['image'],
    );
  }
}
