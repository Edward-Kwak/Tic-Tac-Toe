import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingInitial()) {
    on<SettingMaxNumberChanged>(_onSettingMaxNumberChanged);
    on<SettingWinningCountChanged>(_onSettingWinningCountChanged);
    on<SettingPlayerColorChanged>(_onSettingPlayerColorChanged);
    on<SettingPlayerIconChanged>(_onSettingPlayerIconChanged);
    on<SettingPlayerOrderChanged>(_onSettingPlayerOrderChanged);
  }

  int maxNumber = 3;
  int winningCount = 3;

  int firstPlayerColorIndex = 0;
  int secondPlayerColorIndex = 1;
  int firstPlayerIconIndex = 0;
  int secondPlayerIconIndex = 1;
  int firstAttackPlayerNumber = 1;

  FutureOr<void> _onSettingMaxNumberChanged(
    SettingMaxNumberChanged event,
    Emitter<SettingState> emit,
  ) {
    if (event.maxNumber < 3 || event.maxNumber > 6) {
      return null;
    }

    maxNumber = event.maxNumber;

    emit(SettingDataChecked(maxNumber: maxNumber, winningCount: winningCount));
  }

  FutureOr<void> _onSettingWinningCountChanged(
    SettingWinningCountChanged event,
    Emitter<SettingState> emit,
  ) {
    if (event.count < 3 || event.count > 6) {
      return null;
    }

    winningCount = event.count;

    emit(SettingDataChecked(maxNumber: maxNumber, winningCount: winningCount));
  }

  FutureOr<void> _onSettingPlayerColorChanged(
    SettingPlayerColorChanged event,
    Emitter<SettingState> emit,
  ) {
    if (event.playerNumber == 1) {
      if (secondPlayerColorIndex == event.colorIndex) {
        return null;
      }

      firstPlayerColorIndex = event.colorIndex;
    } else if (event.playerNumber == 2) {
      if (firstPlayerColorIndex == event.colorIndex) {
        return null;
      }

      secondPlayerColorIndex = event.colorIndex;
    }

    emit(SettingPlayerDataChecked(
      firstPlayerColorIndex: firstPlayerColorIndex,
      secondPlayerColorIndex: secondPlayerColorIndex,
      firstPlayerIconIndex: firstPlayerIconIndex,
      secondPlayerIconIndex: secondPlayerIconIndex,
      firstAttackPlayerNumber: firstAttackPlayerNumber,
    ));
  }

  FutureOr<void> _onSettingPlayerIconChanged(
    SettingPlayerIconChanged event,
    Emitter<SettingState> emit,
  ) {
    if (event.playerNumber == 1) {
      if (secondPlayerIconIndex == event.iconIndex) {
        return null;
      }

      firstPlayerIconIndex = event.iconIndex;
    } else if (event.playerNumber == 2) {
      if (firstPlayerIconIndex == event.iconIndex) {
        return null;
      }

      secondPlayerIconIndex = event.iconIndex;
    }

    emit(SettingPlayerDataChecked(
      firstPlayerColorIndex: firstPlayerColorIndex,
      secondPlayerColorIndex: secondPlayerColorIndex,
      firstPlayerIconIndex: firstPlayerIconIndex,
      secondPlayerIconIndex: secondPlayerIconIndex,
      firstAttackPlayerNumber: firstAttackPlayerNumber,
    ));
  }

  FutureOr<void> _onSettingPlayerOrderChanged(
    SettingPlayerOrderChanged event,
    Emitter<SettingState> emit,
  ) {
    firstAttackPlayerNumber = event.firstNumber;

    emit(SettingPlayerDataChecked(
      firstPlayerColorIndex: firstPlayerColorIndex,
      secondPlayerColorIndex: secondPlayerColorIndex,
      firstPlayerIconIndex: firstPlayerIconIndex,
      secondPlayerIconIndex: secondPlayerIconIndex,
      firstAttackPlayerNumber: firstAttackPlayerNumber,
    ));
  }
}
