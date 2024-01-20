import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;
import 'package:uuid/uuid.dart';

import 'ingredient.m.dart';
import 'recipe_image.m.dart';
import 'recipe_instruction.m.dart';

part 'recipe.m.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject implements parser.Recipe {
  Recipe({
    required this.uuid,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.name,
  });

  @HiveField(0)
  final Uuid uuid;

  @HiveField(1)
  @override
  final String description;

  @HiveField(2)
  @override
  final RecipeImage image;

  @HiveField(3)
  @override
  final List<Ingredient> ingredients;

  @HiveField(4)
  @override
  final List<RecipeInstruction> instructions;

  @HiveField(5)
  @override
  final String name;
}
