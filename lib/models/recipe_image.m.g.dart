// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_image.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeImageAdapter extends TypeAdapter<RecipeImage> {
  @override
  final int typeId = 2;

  @override
  RecipeImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeImage(
      url: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeImage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
