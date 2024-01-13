import 'package:hive/hive.dart';
import 'package:my_recipies/models/measurements/measurement.m.dart';
import 'package:my_recipies/models/measurements/unit.m.dart';

part 'milliliter.m.g.dart';

@HiveType(typeId: 6)
class Milliliter extends HiveObject implements Measurement {
  Milliliter({
    required this.value,
  }) {
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

  @override
  @HiveField(0)
  late Unit unit;

  @override
  @HiveField(1)
  double value;
}
