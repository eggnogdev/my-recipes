import 'package:format/format.dart';
import 'package:my_recipies/models/measurements/measurement.m.dart';
import 'package:my_recipies/models/measurements/unit.m.dart';

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
    final res = '{}${measurement.unit.shortForm} $item';
    if (measurement.value % 1 == 0) {
      return res.format(measurement.value.floor());
    } else {
      return res.format(measurement.value.toStringAsFixed(2));
    }
  }
}
