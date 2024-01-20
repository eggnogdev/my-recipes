import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;

part 'ingredient.m.g.dart';

@HiveType(typeId: 1)
class Ingredient extends HiveObject implements parser.Ingredient {
  Ingredient({
    required this.text,
  });

  @HiveField(0)
  @override
  final String text;

  static List<Ingredient> fromParsed(List<parser.Ingredient> parsed) {
    return [
      for (final ing in parsed)
        Ingredient(
          text: ing.text,
        )
    ];
  }
}
