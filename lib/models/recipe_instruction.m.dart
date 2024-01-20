import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;

class RecipeInstruction extends HiveObject implements parser.RecipeInstruction {
  RecipeInstruction({
    required this.text,
  });

  @override
  final String text;
}
