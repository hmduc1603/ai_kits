// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_counter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyCounterAdapter extends TypeAdapter<DailyCounter> {
  @override
  final int typeId = 88;

  @override
  DailyCounter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyCounter(
      updatedDate: fields[1] as DateTime,
      counting: fields[0] as int,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DailyCounter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.counting)
      ..writeByte(1)
      ..write(obj.updatedDate)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyCounterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
