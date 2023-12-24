class Unit {
  const Unit({
    required this.shortForm,
    required this.longForm,
    required this.system,
  });

  final String shortForm;
  final String longForm;
  final UnitSystem system;

  factory Unit.milliliter() {
    return const Unit(
      shortForm: 'ml',
      longForm: 'milliliter',
      system: UnitSystem.metric,
    );
  }

  factory Unit.liter() {
    return const Unit(
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

enum UnitSystem {
  metric,
  customary,
}
