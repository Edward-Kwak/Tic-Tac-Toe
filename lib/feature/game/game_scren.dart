import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/feature/game/bloc/game_bloc.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
    required this.firstPlayerColor,
    required this.secondPlayerColor,
    required this.firstPlayerIcon,
    required this.secondPlayerIcon,
    required this.firstAttackPlayer,
    required this.maxNumber,
  });

  final Color firstPlayerColor;
  final Color secondPlayerColor;
  final IconData firstPlayerIcon;
  final IconData secondPlayerIcon;
  final int firstAttackPlayer;
  final int maxNumber;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQueryData.fromView(View.of(context)).size.width;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GameScreen'),
          leading: IconButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              final result = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('종료하고 나가시겠습니까?'),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('확인'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('취소'),
                    ),
                  ],
                ),
              );

              if (result != true) {
                return;
              }

              navigator.pop();
            },
            icon: const Icon(CupertinoIcons.back),
          ),
        ),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 24),
                Column(
                  children: [
                    const Text('Player1'),
                    const SizedBox(height: 8),
                    BlocBuilder<GameBloc, GameState>(
                      buildWhen: (previous, current) => current is GameMarkChecked,
                      builder: (context, state) {
                        int count = 3;

                        if (state is GameMarkChecked) {
                          count = state.firstPlayerUndoCount;
                        }

                        return Text('무르기 횟수: $count');
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<GameBloc>().add(const GameUndoRequested(playerNumber: 1)),
                      child: const Text('무르기'),
                    ),
                  ],
                ),
                Icon(firstPlayerIcon, color: firstPlayerColor),
                const Spacer(),
                Column(
                  children: [
                    const Text('Player2'),
                    const SizedBox(height: 8),
                    BlocBuilder<GameBloc, GameState>(
                      buildWhen: (previous, current) => current is GameMarkChecked,
                      builder: (context, state) {
                        int count = 3;

                        if (state is GameMarkChecked) {
                          count = state.secondPlayerUndoCount;
                        }

                        return Text('무르기 횟수: $count');
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<GameBloc>().add(const GameUndoRequested(playerNumber: 2)),
                      child: const Text('무르기'),
                    ),
                  ],
                ),
                Icon(secondPlayerIcon, color: secondPlayerColor),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<GameBloc, GameState>(
              buildWhen: (previous, current) => current is GameMarkChecked,
              builder: (context, state) {
                int currentPlayerNumber = firstAttackPlayer;

                if (state is GameMarkChecked) {
                  currentPlayerNumber = state.currentPlayerNumber;
                }

                return Text('현재 공격: Player $currentPlayerNumber');
              },
            ),
            const SizedBox(height: 16),
            const Text('남은 시간: 15초'),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: maxNumber),
                itemCount: maxNumber * maxNumber,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    final bloc = context.read<GameBloc>();

                    bloc.add(GamePlayed(markIndex: index, playerNumber: bloc.currentPlayer));
                  },
                  child: BlocBuilder<GameBloc, GameState>(
                    buildWhen: (previous, current) => current is GameMarkChecked,
                    builder: (context, state) {
                      Color? color;
                      IconData? iconData;

                      if (state is GameMarkChecked) {
                        color = state.markMap[index]?.color;
                        iconData = state.markMap[index]?.iconData;
                      }

                      return Container(
                        height: maxWidth / maxNumber,
                        width: maxWidth / maxNumber,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: Colors.black12),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Text('${index + 1}'),
                            ),
                            if (iconData != null) Center(child: Icon(iconData, color: color))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
