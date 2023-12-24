import 'package:my_recipies/models/measurements/measurement.m.dart';
import 'package:my_recipies/models/measurements/unit.m.dart';

class Liter with Measurement {
  Liter({
    required double value,
  }) {
    this.value = value;
    unit = Unit.liter();
  }

  @override
  Measurement convertTo(Unit other) {
    if (other == Unit.milliliter()) {
      return Measurement.milliliter(value * 1000);
    } else {
      return convertTo(Unit.milliliter()).convertTo(other);
    }
  }
}
