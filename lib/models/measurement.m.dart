import 'package:my_recipies/models/units/metric/liter.m.dart';
import 'package:my_recipies/models/units/metric/milliliter.m.dart';
import 'package:my_recipies/models/units/unit.m.dart';

/// Measurement mixin class defines [convertTo] method and factories that will
/// easily instantiate supported measurements
///
/// Each measurement that this app supports (milliliter, us cups, etc) mixins
/// this mixin class. The defined [convertTo] method allows each measurement to
/// perform their own operations to get from its own [Unit] to another
///
///
abstract mixin class Measurement {
  /// the quantity (`value` cups, `value` milliliters)
  double value = -1;

  /// the type of measurement
  MeasurementType? measurementType;

  /// unit information about this measurement
  late Unit unit;

  /// convert from `this.unit` to `other`
  Measurement convertTo(Unit other);

  factory Measurement.milliliter(double value) {
    return Milliliter(
      value: value,
      unit: Unit.milliliter(),
    );
  }

  factory Measurement.liter(double value) {
    return Liter(
      value: value,
      unit: Unit.liter(),
    );
  }
}

enum MeasurementType {
  mass,
  volume,
}
