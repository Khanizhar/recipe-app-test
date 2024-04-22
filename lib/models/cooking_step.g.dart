// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CookingStepAdapter extends TypeAdapter<CookingStep> {
  @override
  final int typeId = 1;

  @override
  CookingStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CookingStep(
      description: fields[0] as String,
      ingredients: (fields[1] as List).cast<Ingredient>(),
    );
  }

  @override
  void write(BinaryWriter writer, CookingStep obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookingStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
