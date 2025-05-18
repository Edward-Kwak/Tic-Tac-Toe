import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/const/app_const.dart';
import 'package:tic_tac_toe/data/datasource/local/app_local_datasource.dart';
import 'package:tic_tac_toe/di/di.dart';
import 'package:tic_tac_toe/feature/game/bloc/game_bloc.dart';
import 'package:tic_tac_toe/feature/game/game_scren.dart';
import 'package:tic_tac_toe/feature/setting/bloc/setting_bloc.dart';
import 'package:tic_tac_toe/feature/setting/widget/player_column.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int firstAttackPlayer = Random().nextInt(2) + 1;

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

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => GameBloc(
                      firstPlayerColorIndex: bloc.firstPlayerColorIndex,
                      secondPlayerColorIndex: bloc.secondPlayerColorIndex,
                      firstPlayerIconIndex: bloc.firstPlayerIconIndex,
                      secondPlayerIconIndex: bloc.secondPlayerIconIndex,
                      firstAttackPlayerNumber: firstAttackPlayer,
                      maxNumber: bloc.maxNumber,
                      appLocalDatasource: getIt<AppLocalDatasource>(),
                    ),
                    child: GameScreen(
                      firstPlayerColor: AppConst.colorList[bloc.firstPlayerColorIndex],
                      secondPlayerColor: AppConst.colorList[bloc.secondPlayerColorIndex],
                      firstPlayerIcon: AppConst.iconList[bloc.firstPlayerIconIndex],
                      secondPlayerIcon: AppConst.iconList[bloc.secondPlayerIconIndex],
                      firstAttackPlayer: firstAttackPlayer,
                      maxNumber: bloc.maxNumber,
                    ),
                  ),
                ),
              );
            },
            child: const Text('게임시작'),
          ),
        ],
      ),
    );
  }
}
