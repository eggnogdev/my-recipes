import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;

part 'recipe_image.m.g.dart';

@HiveType(typeId: 2)
class RecipeImage extends HiveObject implements parser.RecipeImage {
  RecipeImage({
    required this.url,
  });

  @HiveField(0)
  @override
  final String url;
}
