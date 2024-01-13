import 'package:hive/hive.dart';
import 'package:my_recipies/models/measurements/measurement.m.dart';
import 'package:my_recipies/models/measurements/unit.m.dart';

part 'liter.m.g.dart';

@HiveType(typeId: 2)
class Liter extends HiveObject implements Measurement {
  Liter({
    required this.value,
  }) {
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

  @override
  @HiveField(0)
  late Unit unit;

  @override
  @HiveField(1)
  double value;
}
