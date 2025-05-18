import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/feature/game/game_scren.dart';
import 'package:tic_tac_toe/feature/setting/bloc/setting_bloc.dart';
import 'package:tic_tac_toe/feature/setting/widget/player_column.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SettingScreen')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('게임판 크기: '),
              BlocBuilder<SettingBloc, SettingState>(
                buildWhen: (previous, current) => current is SettingDataChecked,
                builder: (context, state) {
                  int maxNumber = 3;

                  if (state is SettingDataChecked) {
                    maxNumber = state.maxNumber;
                  }

                  return Text('$maxNumber칸');
                },
              ),
              IconButton(
                onPressed: () {
                  final bloc = context.read<SettingBloc>();
                  bloc.add(SettingMaxNumberChanged(maxNumber: bloc.maxNumber + 1));
                },
                icon: const Icon(CupertinoIcons.add),
              ),
              IconButton(
                onPressed: () {
                  final bloc = context.read<SettingBloc>();
                  bloc.add(SettingMaxNumberChanged(maxNumber: bloc.maxNumber - 1));
                },
                icon: const Icon(CupertinoIcons.minus),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('승리 조건: '),
              BlocBuilder<SettingBloc, SettingState>(
                buildWhen: (previous, current) => current is SettingDataChecked,
                builder: (context, state) {
                  int winningCount = 3;

                  if (state is SettingDataChecked) {
                    winningCount = state.winningCount;
                  }

                  return Text('$winningCount회');
                },
              ),
              IconButton(
                onPressed: () {
                  final bloc = context.read<SettingBloc>();
                  bloc.add(SettingWinningCountChanged(count: bloc.winningCount + 1));
                },
                icon: const Icon(CupertinoIcons.add),
              ),
              IconButton(
                onPressed: () {
                  final bloc = context.read<SettingBloc>();
                  bloc.add(SettingWinningCountChanged(count: bloc.winningCount - 1));
                },
                icon: const Icon(CupertinoIcons.minus),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlayerColumn(playerNumber: 1),
              PlayerColumn(playerNumber: 2),
            ],
          ),
          BlocBuilder<SettingBloc, SettingState>(
            buildWhen: (previous, current) => current is SettingPlayerDataChecked,
            builder: (context, state) {
              int firstAttackPlayer = Random().nextInt(2) + 1;

              if (state is SettingPlayerDataChecked) {
                firstAttackPlayer = state.firstAttackPlayerNumber;
              }

              return Text('선공: Player $firstAttackPlayer');
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              final bloc = context.read<SettingBloc>();

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GameScreen()));
            },
            child: const Text('게임시작'),
          ),
        ],
      ),
    );
  }
}
