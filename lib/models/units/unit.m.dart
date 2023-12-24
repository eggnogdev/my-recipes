class Unit {
  const Unit({
    required this.abbreviation,
    required this.longForm,
    required this.system,
    required this.unitType,
  });

  final String abbreviation;
  final String longForm;
  final UnitSystem system;
  final UnitType? unitType;

  factory Unit.milliliter() {
    return const Unit(
      abbreviation: 'ml',
      longForm: 'milliliter',
      system: UnitSystem.metric,
      unitType: UnitType.liquid,
    );
  }

  factory Unit.liter() {
    return const Unit(
      abbreviation: 'l',
      longForm: 'liter',
      system: UnitSystem.metric,
      unitType: UnitType.liquid,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Unit &&
        other.abbreviation == abbreviation &&
        other.longForm == longForm &&
        other.system == system &&
        other.unitType == unitType;
  }

  @override
  int get hashCode => longForm.hashCode;
}

enum UnitSystem {
  metric,
  customary,
}

enum UnitType {
  liquid,
  solid,
}
