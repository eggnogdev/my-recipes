// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milliliter.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MilliliterAdapter extends TypeAdapter<Milliliter> {
  @override
  final int typeId = 6;

  @override
  Milliliter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Milliliter(
      value: fields[0] as double,
    )..unit = fields[1] as Unit;
  }

  @override
  void write(BinaryWriter writer, Milliliter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MilliliterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
