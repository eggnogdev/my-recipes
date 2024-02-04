// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.s.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeState, Store {
  late final _$recipesAtom = Atom(name: '_HomeState.recipes', context: context);

  @override
  Iterable<Recipe> get recipes {
    _$recipesAtom.reportRead();
    return super.recipes;
  }

  @override
  set recipes(Iterable<Recipe> value) {
    _$recipesAtom.reportWrite(value, super.recipes, () {
      super.recipes = value;
    });
  }

  late final _$addRecipeAsyncAction =
      AsyncAction('_HomeState.addRecipe', context: context);

  @override
  Future<void> addRecipe(Recipe recipe) {
    return _$addRecipeAsyncAction.run(() => super.addRecipe(recipe));
  }

  late final _$deleteRecipeAsyncAction =
      AsyncAction('_HomeState.deleteRecipe', context: context);

  @override
  Future<void> deleteRecipe(Recipe recipe) {
    return _$deleteRecipeAsyncAction.run(() => super.deleteRecipe(recipe));
  }

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

  @override
  void loadRecipes() {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.loadRecipes');
    try {
      return super.loadRecipes();
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recipes: ${recipes}
    ''';
  }
}
