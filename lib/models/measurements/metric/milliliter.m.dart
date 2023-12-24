import 'package:my_recipies/models/measurements/measurement.m.dart';
import 'package:my_recipies/models/measurements/unit.m.dart';

class Milliliter with Measurement {
  Milliliter({
    required double value,
  }) {
    this.value = value;
    unit = Unit.milliliter();
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
