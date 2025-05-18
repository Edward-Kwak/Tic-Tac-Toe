import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_data.freezed.dart';

@freezed
class MarkData with _$MarkData {
  const factory MarkData({
    required int playerNumber,
    required int rowNumber,
    required int columnNumber,
    required Color color,
    required IconData iconData,
  }) = _MarkData;
}
