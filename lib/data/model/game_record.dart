import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/data/model/mark_data.dart';

part 'game_record.freezed.dart';
part 'game_record.g.dart';

@freezed
class GameRecord with _$GameRecord {
  @HiveType(typeId: 1)
  const factory GameRecord({
    @HiveField(0) int? winnerPlayer,
    @HiveField(1) required int firstPlayerColorIndex,
    @HiveField(2) required int secondPlayerColorIndex,
    @HiveField(3) required int firstPlayerIconIndex,
    @HiveField(4) required int secondPlayerIconIndex,
    @HiveField(5) required List<MarkData> markDataList,
  }) = _GameRecord;
}
