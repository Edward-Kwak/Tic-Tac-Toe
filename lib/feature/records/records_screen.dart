import 'package:flutter/material.dart';
import 'package:tic_tac_toe/data/datasource/local/app_local_datasource.dart';
import 'package:tic_tac_toe/di/di.dart';
import 'package:tic_tac_toe/feature/records/record_detail_screen.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recordList = getIt<AppLocalDatasource>().getGameRecordList();

    Widget body;

    if (recordList.isEmpty) {
      body = const Center(child: Text('저장된 게임이 없습니다'));
    } else {
      body = ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => RecordDetailScreen(gameRecord: recordList[index])),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 80,
            decoration: const BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.blue))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('GameRecord ${index + 1}'),
                const Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: recordList.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('RecordsScreen'),
      ),
      body: body,
    );
  }
}
