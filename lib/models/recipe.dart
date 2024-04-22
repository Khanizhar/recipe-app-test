// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:izhar_test/models/cooking_step.dart';

part 'recipe.g.dart';
@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final int cookTime;
  @HiveField(4)
  final List<CookingStep> steps;
  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cookTime,
    required this.steps,
  });

  factory Recipe.fromMap(Map map) {
    return Recipe(
      id: map['id'],
      title: map['title'],
      imageUrl: map['image'] ??
          'https://m.media-amazon.com/images/I/21cOE-lrhBL._AC_UF1000,1000_QL80_.jpg',
      cookTime: map['readyInMinutes'],
      steps: map['analyzedInstructions'] != null &&
              map['analyzedInstructions'].isNotEmpty
          ? (map['analyzedInstructions'][0]['steps'] as List)
              .map((e) => CookingStep.fromMap(e))
              .toList()
          : [],
    );
  }

  String toJson() {
    return '';
  }

  

  @override
  bool operator ==(covariant Recipe other) {
    if (identical(this, other)) return true;
    return 
      other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ;
  }
}




