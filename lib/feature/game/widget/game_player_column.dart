import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/feature/game/bloc/game_bloc.dart';

class GamePlayerColumn extends StatelessWidget {
  const GamePlayerColumn({
    super.key,
    required this.playerNumber,
    required this.playerIcon,
    required this.playerColor,
  });

  final int playerNumber;
  final IconData playerIcon;
  final Color playerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Player $playerNumber'),
        Icon(playerIcon, color: playerColor),
        BlocBuilder<GameBloc, GameState>(
          buildWhen: (previous, current) => current is GameMarkChecked,
          builder: (context, state) {
            int count = 3;

            if (state is GameMarkChecked) {
              if (playerNumber == 1) {
                count = state.firstPlayerUndoCount;
              } else {
                count = state.secondPlayerUndoCount;
              }
            }

            return Text('무르기 횟수: $count');
          },
        ),
        ElevatedButton(
          onPressed: () => context.read<GameBloc>().add(GameUndoRequested(playerNumber: playerNumber)),
          child: const Text('무르기'),
        ),
      ],
    );
  }
}
