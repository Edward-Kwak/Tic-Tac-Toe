import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'mark_data.freezed.dart';
part 'mark_data.g.dart';

@freezed
class MarkData with _$MarkData {
  @HiveType(typeId: 2)
  const factory MarkData({
    @HiveField(0) required int playerNumber,
    @HiveField(1) required int rowNumber,
    @HiveField(2) required int columnNumber,
    @HiveField(3) required int colorIndex,
    @HiveField(4) required int iconIndex,
  }) = _MarkData;
}
