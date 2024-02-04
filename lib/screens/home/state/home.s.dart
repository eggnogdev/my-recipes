import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_recipes/models/hive_boxes.dart';
import 'package:my_recipes/models/recipe.m.dart';

part 'home.s.g.dart';

class HomeState extends _HomeState with _$HomeState {}

abstract class _HomeState with Store {
  @observable
  Iterable<Recipe> recipes = [];

  /// Load recipes from [Hive] into `this.recipes`
  @action
  void loadRecipes() {
    final box = _recipeBox();
    recipes = box.values;
  }

  /// Add `recipe` into [Hive] then run `this.loadRecipes()`
  @action
  Future<void> addRecipe(Recipe recipe) async {
    final box = _recipeBox();
    await box.put(recipe.uuid, recipe);
    loadRecipes();
  }

  /// Remove `recipe` from [Hive] then run `this.loadRecipes()`
  @action
  Future<void> deleteRecipe(Recipe recipe) async {
    final box = _recipeBox();
    await box.delete(recipe.uuid);
    loadRecipes();
  }

  /// Get the [Recipe] [Hive] [Box]
  Box<Recipe> _recipeBox() {
    return Hive.box<Recipe>(HiveBox.recipes.name);
  }
}
