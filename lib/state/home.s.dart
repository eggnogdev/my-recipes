import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_recipies/models/hive_boxes.dart';
import 'package:my_recipies/models/recipe.m.dart';

part 'home.s.g.dart';

class HomeState extends _HomeState with _$HomeState {}

abstract class _HomeState with Store {
  @observable
  Iterable<Recipe> recipies = [];

  @action
  void loadRecipies() {
    final box = Hive.box<Recipe>(HiveBox.recipies.name);
    recipies = box.values;
  }
}
