# Measurement Models

How to add a new measurement model to the app. Each measuremnt needs its own model, mostly so they each can have their own conversion method.

## lib/models/units/unit.m.dart

The first step is to define the unit in the `unit.m.dart` file. Here is a template for your definition:

```dart
factory Unit.</>() {
  return const Unit(
    shortForm: </>,
    longForm: </>,
    system: UnitSystem.</>,
  );
}
```

Add this factory definition to the `Unit` class and replace all the `</>` placeholders with the correct values according to your unit. look at the other factory definitions for hints.

## Your measurement model file (lib/models/measurements/)

The structure of the models is separated by the unit system (metric, us customary, etc) and then in those directories are each supported unit. Create a new file for your unit and place it in the corresponding unit system folder.

Simply name the file `</>.m.dart`, replacing the `</>` placeholder with whatever the unit you are adding is. Here is a template for what you will write in this file:

```dart
import 'package:my_recipies/models/measurements/measurement.m.dart';
import 'package:my_recipies/models/measurements/unit.m.dart';

class TemplateMeasurement with Measurement {
  TemplateMeasurement({
    required double value,
  }) {
    this.value = value;
    unit = Unit.</>();
  }

  @override
  Measurement convertTo(Unit other) {
    if (other == Unit.</>()) {
      return Measurement.</>(</>);
    } else {
      throw Exception(
        'Unable to convert ${unit.longForm} to ${other.longForm}',
      );
    }
  }
}
```

Give your measurement model a fitting name, take a look at the existing models for ideas. Then you can replace the `</>` placeholders with the proper values.

## The convertTo method

The `convertTo` method requires a more detailed explanation because of how I decided conversion should work in this app.

### Primary Unit

with each unit system, I have chosen a "main" or primary unit that all conversions will go through. The idea is to decrease the number of conversions that must be hardcoded into the app.

So to convert between units, and especially unit systems, the value will first convert to the primary unit, and then to the destination unit. This way, only the primary unit needs a definition of each conversion rather than *every* unit needing *every* conversion.

### Definition (part 1)

If you are adding a unit that wont be a primary unit, definition is quite simple.

```dart
@override
Measurement convertTo(Unit other) {
  if (other == Unit.primary_of_system()) {
    return Measurement.primary_of_system(</>);
  } else {
    return convertTo(Unit.primary_of_system()).convertTo(other);
  }
}
```

Make sure you swap `primary_of_system` with the respective unit, and of course the `</>` placeholder with the correct calculation/new value.

As you can see, if `other` is the `primary_of_system` then it will return the new `Measurement` instance with the correct value and unit. If `other` is any other unit, then it recalls `convertTo` with the `primary_of_system` as the argument to first get the `primary_of_system` value and then it will convert that to the destination `Unit`.

### Definition (part 2)

If you're adding a new unit that will be the primary unit, then it will be a bit more work to define the `convertTo` method.

In this case you will have to define a conversion for every existing `Unit` within the same system, as well as a conversion for every existing primary `Unit` in the other systems.

```dart
@override
Measurement convertTo(Unit other) {
  if (other == Unit.unit_same_system()) {
    return Measurement.unit_same_system(</>);
  } else if (other == Unit.primary_other_system()) {
    return Measurement.primary_other_system(</>);
  } else {
    throw Exception(
      'Unable to convert ${unit.longForm} to ${other.longForm}',
    );
  }
}
```

Continue adding if/else statements for each `Unit` within system and each primary `Unit` in other `UnitSystem`s. Then finalize with an else statement that throws an exception stating that we can't convert to the destination `Unit`.

### Definition (part 3)

Finally you need to make sure other `Measurement`s can convert to your new one. If your `Unit` isn't the primary one, then go to the primary `Unit`'s `Measurement.convertTo` definition and add in the conversion necessary to get from that `Measurement` to yours. If your `Unit` is the primary one, then you have to go to every primary `Unit`'s `Measurement.convertTo` definition and add in the conversion to get from that `Measurement` to yours.

## lib/models/measurements/measurement.m.dart

Once those steps are complete, you can add in a new factory constructor that will make it very easy to see the new `Measurement` and use it.

```dart
factory Measurement.</>(double value) {
  return TemplateMeasurement(value: value);
}
```

just replace the `</>` placeholder with your unit, ideally the same name as the `Unit` factory constructor you created earlier. And of course change the `TemplateMeasurement` to the name of the `Measurement` model you just created.

Now the new `Measurement` can be used so easily and convert between all the other units

## Hive Objects

Make sure you update all your newly added files to work with Hive. You can use the existing files as reference or ask for help from eggnog.