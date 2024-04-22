import 'package:hive_flutter/hive_flutter.dart';
part 'ingredient.g.dart';

@HiveType(typeId: 2)
class Ingredient {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  Ingredient({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      id: map['id'],
      name: map['name'],
      image: map['image'] != null && map['image'].isNotEmpty
          ? map['image']
          : 'https://m.media-amazon.com/images/I/21cOE-lrhBL._AC_UF1000,1000_QL80_.jpg',
    );
  }
}