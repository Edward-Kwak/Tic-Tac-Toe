import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/app.dart';
import 'package:tic_tac_toe/data/model/game_record.dart';
import 'package:tic_tac_toe/data/model/mark_data.dart';
import 'package:tic_tac_toe/di/di.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GameRecordImplAdapter());
  Hive.registerAdapter(MarkDataImplAdapter());
  await configureDependencies();

  runApp(const App());
}
