import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;

part 'recipe_instruction.g.dart';

@HiveType(typeId: 3)
class RecipeInstruction extends HiveObject implements parser.RecipeInstruction {
  RecipeInstruction({
    required this.text,
  });

  @HiveField(0)
  @override
  final String text;

  static List<RecipeInstruction> fromParsed(
      List<parser.RecipeInstruction> parsed) {
    return [
      for (final inst in parsed)
        RecipeInstruction(
          text: inst.text,
        )
    ];
  }
}
