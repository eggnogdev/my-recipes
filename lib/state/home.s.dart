import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_recipes/models/hive_boxes.dart';
import 'package:my_recipes/models/recipe.m.dart';

part 'home.s.g.dart';

class HomeState extends _HomeState with _$HomeState {}

abstract class _HomeState with Store {
  @observable
  Iterable<Recipe> recipes = [];

  @action
  void loadRecipes() {
    final box = Hive.box<Recipe>(HiveBox.recipes.name);
    recipes = box.values;
  }
}
