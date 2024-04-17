// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.s.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PreferencesState on _PreferencesState, Store {
  late final _$recipeKeepAwakeAtom =
      Atom(name: '_PreferencesState.recipeKeepAwake', context: context);

  @override
  bool get recipeKeepAwake {
    _$recipeKeepAwakeAtom.reportRead();
    return super.recipeKeepAwake;
  }

  @override
  set recipeKeepAwake(bool value) {
    _$recipeKeepAwakeAtom.reportWrite(value, super.recipeKeepAwake, () {
      super.recipeKeepAwake = value;
    });
  }

  @override
  String toString() {
    return '''
recipeKeepAwake: ${recipeKeepAwake}
    ''';
  }
}
