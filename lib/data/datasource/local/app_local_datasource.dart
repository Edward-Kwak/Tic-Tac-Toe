import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/data/model/game_record.dart';

final class AppLocalDatasource {
  final Box box;

  const AppLocalDatasource({required this.box});

  List<GameRecord> getGameRecordList() => box.get('game_record') ?? [];

  Future<void> saveGameRecord(GameRecord gameRecord) async {
    List<GameRecord> cur = getGameRecordList();

    cur = [gameRecord, ...cur];

    await box.put('game_record', cur);
  }
}
