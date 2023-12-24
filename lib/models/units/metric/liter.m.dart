import 'package:my_recipies/models/measurement.m.dart';
import 'package:my_recipies/models/units/unit.m.dart';

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
      throw Exception(
        'Unable to convert ${unit.longForm} to ${other.longForm}',
      );
    }
  }
}
