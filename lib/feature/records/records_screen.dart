import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 16),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('GameRecord ${DateFormat('yyyy-MM-dd').format(recordList[index].createdAt)}'),
                    const SizedBox(height: 8),
                    if (recordList[index].winnerPlayer != null)
                      Text('Winner: Player${recordList[index].winnerPlayer}')
                    else
                      const Text('무승부'),
                  ],
                ),
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
