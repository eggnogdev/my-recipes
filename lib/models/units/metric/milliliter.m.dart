import 'package:my_recipies/models/measurement.m.dart';
import 'package:my_recipies/models/units/unit.m.dart';

class Milliliter with Measurement {
  Milliliter({
    required double value,
    required Unit unit,
  }) {
    this.value = value;
    this.unit = unit;
  }

  @override
  Measurement convertTo(Unit other) {
    if (other == Unit.liter()) {
      return Measurement.liter(value / 1000);
    } else {
      throw Exception(
        'Unable to convert ${unit.longForm} to ${other.longForm}',
      );
    }
  }
}
