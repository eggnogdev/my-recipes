import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';

import 'package:myrecipes/enums/hive_boxes.dart';
import 'package:myrecipes/enums/preferences.dart';

part 'preferences.s.g.dart';

class PreferencesState extends _PreferencesState with _$PreferencesState {}

abstract class _PreferencesState with Store {
  @observable
  bool recipeKeepAwake = true;

  /// Load the preferences from the hive box
  void load() {
    final box = _box();

    recipeKeepAwake = box.get(
      Preferences.recipeKeepAwake,
      defaultValue: true, // if the key isn't set
    );
  }

  /// Save the preferences to the hive box
  Future<void> save() async {
    final box = _box();
    await box.put(Preferences.recipeKeepAwake, recipeKeepAwake);
  }

  Box _box() {
    return Hive.box(HiveBox.preferences.name);
  }
}
