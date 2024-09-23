// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FruitAdapter extends TypeAdapter<Fruit> {
  @override
  final int typeId = 0;

  @override
  Fruit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fruit(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Fruit obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FruitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
