import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;
import 'package:uuid/uuid.dart';

import 'ingredient.dart';
import 'recipe_image.dart';
import 'recipe_instruction.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject implements parser.Recipe {
  Recipe({
    required this.uuid,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.name,
    this.url,
  });

  @HiveField(0)
  final String uuid;

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

  @HiveField(6)
  @override
  final String? url;

  static Future<Recipe> fromParsed(parser.Recipe parsed) async {
    final uuid = const Uuid().v1();
    return Recipe(
      uuid: uuid,
      description: parsed.description,
      image: await RecipeImage.fromParsed(
        parsed.image,
      ),
      ingredients: Ingredient.fromParsed(parsed.ingredients),
      instructions: RecipeInstruction.fromParsed(parsed.instructions),
      name: parsed.name,
      url: parsed.url,
    );
  }
}
