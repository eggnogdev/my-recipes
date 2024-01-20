// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.s.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeState, Store {
  late final _$recipiesAtom =
      Atom(name: '_HomeState.recipies', context: context);

  @override
  Iterable<Recipe> get recipies {
    _$recipiesAtom.reportRead();
    return super.recipies;
  }

  @override
  set recipies(Iterable<Recipe> value) {
    _$recipiesAtom.reportWrite(value, super.recipies, () {
      super.recipies = value;
    });
  }

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

  @override
  void loadRecipies() {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.loadRecipies');
    try {
      return super.loadRecipies();
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recipies: ${recipies}
    ''';
  }
}
