import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:myrecipes/enums/hive_boxes.dart';
import 'package:myrecipes/models/recipe.dart';

part 'recipe_state.g.dart';

class RecipeState extends _RecipeState with _$RecipeState {
  RecipeState({
    required super.uuid,
  });
}

abstract class _RecipeState with Store {
  _RecipeState({
    required String uuid,
  }) {
    final box = Hive.box<Recipe>(HiveBox.recipes.name);
    final found = box.get(uuid);

    if (found == null) {
      throw Exception('Could not find recipe with uuid: $uuid');
    } else {
      recipe = found;
    }
  }

  late Recipe recipe;
}
