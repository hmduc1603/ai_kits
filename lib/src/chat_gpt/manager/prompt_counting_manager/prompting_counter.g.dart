// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompting_counter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PromptingCounterAdapter extends TypeAdapter<PromptingCounter> {
  @override
  final int typeId = 5;

  @override
  PromptingCounter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PromptingCounter(
      updatedDate: fields[1] as DateTime,
      counting: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PromptingCounter obj) {
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
      other is PromptingCounterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
