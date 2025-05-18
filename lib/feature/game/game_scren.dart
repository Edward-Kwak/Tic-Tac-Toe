import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/const/app_const.dart';
import 'package:tic_tac_toe/feature/game/bloc/game_bloc.dart';
import 'package:tic_tac_toe/feature/game/widget/game_dialog.dart';
import 'package:tic_tac_toe/feature/game/widget/game_player_column.dart';

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

    return BlocListener<GameBloc, GameState>(
      listener: (context, state) async {
        final navigator = Navigator.of(context);
        final bloc = context.read<GameBloc>();

        if (state is GameFinished) {
          final result = await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => GameDialog(
                    title: '게임이 종료되었습니다',
                    content: '''
${state.winnerPlayer == null ? '무승부입니다' : '우승: Player${state.winnerPlayer}'}
결과를 저장하시겠습니까?
''',
                    hasCancel: true,
                  ));

          if (result != true) {
            navigator.pop();

            return;
          }

          bloc.add(const GameSaveRequested());
        } else if (state is GameSaveError) {
          await showDialog(
            context: context,
            builder: (context) => const GameDialog(content: '저장에 실패했습니다.'),
          );

          navigator.pop();
        } else if (state is GameSaveSucceed) {
          await showDialog(
            context: context,
            builder: (context) => const GameDialog(content: '저장이 완료되었습니다!'),
          );

          navigator.pop();
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('GameScreen'),
            leading: IconButton(
              onPressed: () async {
                final navigator = Navigator.of(context);

                final result = await showDialog(
                  context: context,
                  builder: (context) => const GameDialog(content: '종료하고 나가시겠습니까?', hasCancel: true),
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
                  GamePlayerColumn(playerNumber: 1, playerIcon: firstPlayerIcon, playerColor: firstPlayerColor),
                  const Spacer(),
                  GamePlayerColumn(playerNumber: 2, playerIcon: secondPlayerIcon, playerColor: secondPlayerColor),
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
              BlocBuilder<GameBloc, GameState>(
                buildWhen: (previous, current) => current is GameTimerLoaded,
                builder: (context, state) {
                  int second = AppConst.maxTimerCount;

                  if (state is GameTimerLoaded) {
                    second = state.second;
                  }

                  return Text('남은 시간: $second초');
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: maxNumber,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
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
                          color = state.markMap[index]?.colorIndex != null
                              ? AppConst.colorList[state.markMap[index]!.colorIndex]
                              : null;
                          iconData = state.markMap[index]?.iconIndex != null
                              ? AppConst.iconList[state.markMap[index]!.iconIndex]
                              : null;
                        }

                        return Container(
                          height: maxWidth / maxNumber,
                          width: maxWidth / maxNumber,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(color: Colors.black12),
                          child: iconData != null ? Icon(iconData, color: color) : const SizedBox.shrink(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
