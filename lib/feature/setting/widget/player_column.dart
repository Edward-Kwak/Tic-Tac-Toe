import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/const/app_const.dart';
import 'package:tic_tac_toe/feature/setting/bloc/setting_bloc.dart';

class PlayerColumn extends StatelessWidget {
  const PlayerColumn({super.key, required this.playerNumber});

  final int playerNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Player $playerNumber'),
        const SizedBox(height: 12),
        Row(
          children: List.generate(
            AppConst.colorList.length,
            (index) => InkWell(
              onTap: () => context
                  .read<SettingBloc>()
                  .add(SettingPlayerColorChanged(playerNumber: playerNumber, colorIndex: index)),
              child: BlocBuilder<SettingBloc, SettingState>(
                buildWhen: (previous, current) => current is SettingPlayerDataChecked,
                builder: (context, state) {
                  int selectedIndex = playerNumber - 1;

                  if (state is SettingPlayerDataChecked) {
                    if (playerNumber == 1) {
                      selectedIndex = state.firstPlayerColorIndex;
                    } else if (playerNumber == 2) {
                      selectedIndex = state.secondPlayerColorIndex;
                    }
                  }

                  return Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: index == selectedIndex
                          ? const Border.fromBorderSide(BorderSide(color: Colors.black, width: 4))
                          : null,
                      color: AppConst.colorList[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(
            AppConst.iconList.length,
            (index) => InkWell(
              onTap: () => context
                  .read<SettingBloc>()
                  .add(SettingPlayerIconChanged(playerNumber: playerNumber, iconIndex: index)),
              child: BlocBuilder<SettingBloc, SettingState>(
                buildWhen: (previous, current) => current is SettingPlayerDataChecked,
                builder: (context, state) {
                  int selectedIndex = playerNumber - 1;

                  if (state is SettingPlayerDataChecked) {
                    if (playerNumber == 1) {
                      selectedIndex = state.firstPlayerIconIndex;
                    } else if (playerNumber == 2) {
                      selectedIndex = state.secondPlayerIconIndex;
                    }
                  }

                  return Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border: index == selectedIndex
                          ? const Border.fromBorderSide(BorderSide(color: Colors.purple, width: 1))
                          : null,
                    ),
                    child: Icon(AppConst.iconList[index], size: 24),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => context.read<SettingBloc>().add(SettingPlayerOrderChanged(firstNumber: playerNumber)),
          child: const Text('선공하기'),
        ),
      ],
    );
  }
}
