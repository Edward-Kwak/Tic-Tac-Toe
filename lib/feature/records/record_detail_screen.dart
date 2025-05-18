import 'package:flutter/material.dart';
import 'package:tic_tac_toe/const/app_const.dart';
import 'package:tic_tac_toe/data/model/game_record.dart';
import 'package:tic_tac_toe/data/model/mark_data.dart';

class RecordDetailScreen extends StatelessWidget {
  const RecordDetailScreen({super.key, required this.gameRecord});

  final GameRecord gameRecord;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQueryData.fromView(View.of(context)).size.width;

    List<({int? index, MarkData? markData})> historyIndex = List.generate(
      gameRecord.maxNumber * gameRecord.maxNumber,
      (index) => (index: null, markData: null),
    );

    int cur = 0;

    for (int i = 0; i < gameRecord.markDataList.length; i++) {
      cur = gameRecord.markDataList[i].rowNumber * gameRecord.maxNumber + gameRecord.markDataList[i].columnNumber;
      historyIndex[cur] = (index: i, markData: gameRecord.markDataList[i]);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('RecordDetailScreen')),
      body: Column(
        children: [
          if (gameRecord.winnerPlayer == null)
            const Text('게임결과: 무승부')
          else
            Text('우승자: Player${gameRecord.winnerPlayer}'),
          const SizedBox(height: 24),
          Row(
            children: [
              const SizedBox(width: 24),
              const Text('Player1'),
              Icon(
                AppConst.iconList[gameRecord.firstPlayerIconIndex],
                color: AppConst.colorList[gameRecord.firstPlayerColorIndex],
              ),
              const Spacer(),
              const Text('Player2'),
              Icon(
                AppConst.iconList[gameRecord.secondPlayerIconIndex],
                color: AppConst.colorList[gameRecord.secondPlayerColorIndex],
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gameRecord.maxNumber,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              itemCount: gameRecord.maxNumber * gameRecord.maxNumber,
              itemBuilder: (context, index) {
                return Container(
                  height: maxWidth / gameRecord.maxNumber,
                  width: maxWidth / gameRecord.maxNumber,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: Colors.black12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (historyIndex[index].index != null)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Text('${historyIndex[index].index! + 1}번째'),
                        ),
                      if (historyIndex[index].markData != null)
                        Icon(
                          AppConst.iconList[historyIndex[index].markData!.iconIndex],
                          color: AppConst.colorList[historyIndex[index].markData!.colorIndex],
                        )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
