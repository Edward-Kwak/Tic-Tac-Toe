// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameRecordImplAdapter extends TypeAdapter<_$GameRecordImpl> {
  @override
  final int typeId = 1;

  @override
  _$GameRecordImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$GameRecordImpl(
      winnerPlayer: fields[0] as int?,
      firstPlayerColorIndex: fields[1] as int,
      secondPlayerColorIndex: fields[2] as int,
      firstPlayerIconIndex: fields[3] as int,
      secondPlayerIconIndex: fields[4] as int,
      markDataList: (fields[5] as List).cast<MarkOrderData>(),
      maxNumber: fields[6] as int,
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$GameRecordImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.winnerPlayer)
      ..writeByte(1)
      ..write(obj.firstPlayerColorIndex)
      ..writeByte(2)
      ..write(obj.secondPlayerColorIndex)
      ..writeByte(3)
      ..write(obj.firstPlayerIconIndex)
      ..writeByte(4)
      ..write(obj.secondPlayerIconIndex)
      ..writeByte(6)
      ..write(obj.maxNumber)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.markDataList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameRecordImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MarkOrderDataImplAdapter extends TypeAdapter<_$MarkOrderDataImpl> {
  @override
  final int typeId = 3;

  @override
  _$MarkOrderDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MarkOrderDataImpl(
      order: fields[0] as int?,
      markData: fields[1] as MarkData?,
    );
  }

  @override
  void write(BinaryWriter writer, _$MarkOrderDataImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.order)
      ..writeByte(1)
      ..write(obj.markData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkOrderDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
