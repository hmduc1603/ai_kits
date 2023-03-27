// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imaginating_counter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImaginatingCounterAdapter extends TypeAdapter<ImaginatingCounter> {
  @override
  final int typeId = 8;

  @override
  ImaginatingCounter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImaginatingCounter(
      updatedDate: fields[1] as DateTime,
      counting: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ImaginatingCounter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.counting)
      ..writeByte(1)
      ..write(obj.updatedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImaginatingCounterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
