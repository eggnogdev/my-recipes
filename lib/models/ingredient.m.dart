import 'package:my_recipies/models/measurement.m.dart';
import 'package:my_recipies/models/units/unit.m.dart';

class Ingredient {
  const Ingredient({
    required this.measurement,
    required this.item,
  });

  final Measurement measurement;
  final String item;

  Ingredient convertTo(Unit other) {
    return Ingredient(
      measurement: measurement.convertTo(other),
      item: item,
    );
  }

  @override
  String toString() {
    return '${measurement.value}${measurement.unit.abbreviation} $item';
  }
}
