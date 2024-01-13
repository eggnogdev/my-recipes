import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_recipies/models/hive_boxes.dart';
import 'package:my_recipies/models/recipe.m.dart';

part 'recipe.s.g.dart';

class RecipeState extends _RecipeState with _$RecipeState {
  RecipeState({
    required super.uuid,
  });
}

abstract class _RecipeState with Store {
  _RecipeState({
    required String uuid,
  }) {
    final box = Hive.box<Recipe>(HiveBox.recipies.name);
    final found = box.get(uuid);

    if (found == null) {
      throw Exception('Could not find recipe with uuid: $uuid');
    } else {
      recipe = found;
    }
  }

  late Recipe recipe;
}
