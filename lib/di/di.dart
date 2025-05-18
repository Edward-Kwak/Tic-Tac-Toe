import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/data/datasource/local/app_local_datasource.dart';
import 'package:tic_tac_toe/data/model/game_record.dart';
import 'package:tic_tac_toe/data/model/mark_data.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final box = await Hive.openBox('app_box');
  Hive.registerAdapter(GameRecordImplAdapter());
  Hive.registerAdapter(MarkDataImplAdapter());

  getIt.registerLazySingleton<AppLocalDatasource>(
    () => AppLocalDatasource(box: box),
  );
}
