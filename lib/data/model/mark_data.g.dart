// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarkDataImplAdapter extends TypeAdapter<_$MarkDataImpl> {
  @override
  final int typeId = 2;

  @override
  _$MarkDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MarkDataImpl(
      playerNumber: fields[0] as int,
      rowNumber: fields[1] as int,
      columnNumber: fields[2] as int,
      colorIndex: fields[3] as int,
      iconIndex: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$MarkDataImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.playerNumber)
      ..writeByte(1)
      ..write(obj.rowNumber)
      ..writeByte(2)
      ..write(obj.columnNumber)
      ..writeByte(3)
      ..write(obj.colorIndex)
      ..writeByte(4)
      ..write(obj.iconIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
