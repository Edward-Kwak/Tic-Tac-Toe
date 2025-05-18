import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/app.dart';
import 'package:tic_tac_toe/di/di.dart';

void main() async {
  await Hive.initFlutter();
  await configureDependencies();

  runApp(const App());
}
