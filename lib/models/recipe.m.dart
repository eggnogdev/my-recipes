import 'package:hive/hive.dart';

part 'recipe.m.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  Recipe({
    required this.uuid,
    required this.title,
    required this.description,
    required this.ingredients,
  });

  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> ingredients;

  factory Recipe.fromHive(String uuid) {
    final box = Hive.box<Recipe>('recipies');
    final recipe = box.get(uuid);

    if (recipe == null) {
      throw Exception(
        'Could not find recipe with uuid: $uuid',
      );
    } else {
      return recipe;
    }
  }
}
