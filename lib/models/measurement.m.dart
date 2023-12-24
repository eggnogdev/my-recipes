import 'package:my_recipies/models/units/metric/liter.m.dart';
import 'package:my_recipies/models/units/metric/milliliter.m.dart';
import 'package:my_recipies/models/units/unit.m.dart';

/// The main mixin class used to create [Measurement]s for [Ingredient].
///
/// Each measurement that this app supports (milliliter, us cups, etc) mixins
/// [Measurement]
///
/// Each measurement has their own class which is abstracted by [Measurement]
/// because they each need their own [convertTo] method, which is required by
/// [Measurement]
abstract mixin class Measurement {
  /// the quantity (`value` cups, `value` milliliters)
  double value = -1;

  /// unit information about this measurement
  late Unit unit;

  /// convert from `this.unit` to `other`
  Measurement convertTo(Unit other);

  factory Measurement.milliliter(double value) {
    return Milliliter(value: value);
  }

  factory Measurement.liter(double value) {
    return Liter(value: value);
  }
}
