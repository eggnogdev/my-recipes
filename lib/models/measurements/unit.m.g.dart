// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitAdapter extends TypeAdapter<Unit> {
  @override
  final int typeId = 4;

  @override
  Unit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Unit(
      shortForm: fields[0] as String,
      longForm: fields[1] as String,
      system: fields[2] as UnitSystem,
    );
  }

  @override
  void write(BinaryWriter writer, Unit obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.shortForm)
      ..writeByte(1)
      ..write(obj.longForm)
      ..writeByte(2)
      ..write(obj.system);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnitSystemAdapter extends TypeAdapter<UnitSystem> {
  @override
  final int typeId = 5;

  @override
  UnitSystem read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UnitSystem.metric;
      case 1:
        return UnitSystem.customary;
      default:
        return UnitSystem.metric;
    }
  }

  @override
  void write(BinaryWriter writer, UnitSystem obj) {
    switch (obj) {
      case UnitSystem.metric:
        writer.writeByte(0);
        break;
      case UnitSystem.customary:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitSystemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
