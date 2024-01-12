// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liter.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LiterAdapter extends TypeAdapter<Liter> {
  @override
  final int typeId = 2;

  @override
  Liter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Liter(
      value: fields[0] as double,
    )..unit = fields[1] as Unit;
  }

  @override
  void write(BinaryWriter writer, Liter obj) {
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
      other is LiterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
