import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;
import 'package:path_provider/path_provider.dart';

part 'recipe_image.g.dart';

@HiveType(typeId: 2)
class RecipeImage extends HiveObject implements parser.RecipeImage {
  RecipeImage({
    required this.filePath,
    required this.url,
  });

  @HiveField(0)
  @override
  final String url;

  @HiveField(1)
  final String filePath;

  static Future<RecipeImage> fromParsed(parser.RecipeImage parsed) async {
    final res = await http.get(Uri.parse(parsed.url));
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${DateTime.now()}');
    await file.writeAsBytes(res.bodyBytes);
    return RecipeImage(
      filePath: file.path,
      url: parsed.url,
    );
  }
}
