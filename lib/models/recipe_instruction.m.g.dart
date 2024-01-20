// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_instruction.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeInstructionAdapter extends TypeAdapter<RecipeInstruction> {
  @override
  final int typeId = 3;

  @override
  RecipeInstruction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeInstruction(
      text: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeInstruction obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeInstructionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
