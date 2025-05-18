import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/data/model/game_record.dart';

final class AppLocalDatasource {
  final Box box;

  const AppLocalDatasource({required this.box});

  List<GameRecord> getGameRecordList() {
    final results = <GameRecord>[];
    final cur = box.get('game_record') ?? [];

    for (final data in cur) {
      results.add(data);
    }

    return [...results];
  }

  Future<void> saveGameRecord(GameRecord gameRecord) async {
    List<GameRecord> cur = getGameRecordList();

    cur = [gameRecord, ...cur];

    await box.put('game_record', cur);
  }
}
