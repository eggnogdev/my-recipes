import 'package:hive/hive.dart';
import 'package:my_recipies/models/ingredient.m.dart';

part 'recipe.m.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final List<Ingredient> ingredients;

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
