import 'package:hive/hive.dart';

part 'unit.m.g.dart';

@HiveType(typeId: 4)
class Unit extends HiveObject {
  Unit({
    required this.shortForm,
    required this.longForm,
    required this.system,
  });

  @HiveField(0)
  final String shortForm;

  @HiveField(1)
  final String longForm;

  @HiveField(2)
  final UnitSystem system;

  factory Unit.milliliter() {
    return Unit(
      shortForm: 'ml',
      longForm: 'milliliter',
      system: UnitSystem.metric,
    );
  }

  factory Unit.liter() {
    return Unit(
      shortForm: 'l',
      longForm: 'liter',
      system: UnitSystem.metric,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Unit &&
        other.shortForm == shortForm &&
        other.longForm == longForm &&
        other.system == system;
  }

  @override
  int get hashCode => longForm.hashCode;
}

@HiveType(typeId: 5)
enum UnitSystem {
  @HiveField(0)
  metric,
  @HiveField(1)
  customary,
}
