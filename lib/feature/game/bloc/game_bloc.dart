import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/const/app_const.dart';
import 'package:tic_tac_toe/data/datasource/local/app_local_datasource.dart';
import 'package:tic_tac_toe/data/model/game_record.dart';
import 'package:tic_tac_toe/data/model/mark_data.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required int firstAttackPlayerNumber,
    required this.firstPlayerColorIndex,
    required this.secondPlayerColorIndex,
    required this.firstPlayerIconIndex,
    required this.secondPlayerIconIndex,
    required this.maxNumber,
    required this.appLocalDatasource,
  }) : super(const GameInitial()) {
    currentPlayer = firstAttackPlayerNumber;

    on<GameTimerChanged>(_onGameTimerChanged);
    on<GamePlayed>(_onGamePlayed);
    on<GameUndoRequested>(_onGameUndoRequested);
    on<GameRandomPlayed>(_onGameRandomPlayed);
    on<GameSaveRequested>(_onGameSaveRequested);

    runTimer();
  }

  final AppLocalDatasource appLocalDatasource;

  final int firstPlayerColorIndex;
  final int secondPlayerColorIndex;
  final int firstPlayerIconIndex;
  final int secondPlayerIconIndex;
  final int maxNumber;

  int currentPlayer = 1;
  int? winnerPlayer;

  int firstPlayerUndoCount = 3;
  int secondPlayerUndoCount = 3;

  StreamSubscription<int>? streamSubscription;

  List<int> makeDataHistoryList = [];
  Map<int, MarkData?> markMap = {};

  void runTimer() {
    streamSubscription?.cancel();

    add(const GameTimerChanged(second: AppConst.maxTimerCount));

    streamSubscription = Stream.periodic(
      const Duration(seconds: 1),
      (value) => AppConst.maxTimerCount - value - 1,
    ).listen(
      (event) {
        if (event == 0) {
          add(const GameRandomPlayed());

          return;
        }

        add(GameTimerChanged(second: event));
      },
    );
  }

  @override
  Future<void> close() async {
    streamSubscription?.cancel();
    super.close();
  }

  FutureOr<void> _onGameTimerChanged(
    GameTimerChanged event,
    Emitter<GameState> emit,
  ) {
    emit(GameTimerLoaded(second: event.second));
  }

  FutureOr<void> _onGamePlayed(
    GamePlayed event,
    Emitter<GameState> emit,
  ) {
    if (markMap[event.markIndex] != null) {
      return null;
    }

    runTimer();

    int color;
    int iconData;

    if (event.playerNumber == 1) {
      color = firstPlayerColorIndex;
      iconData = firstPlayerIconIndex;
    } else {
      color = secondPlayerColorIndex;
      iconData = secondPlayerIconIndex;
    }

    final data = MarkData(
      playerNumber: event.playerNumber,
      rowNumber: event.markIndex ~/ maxNumber,
      columnNumber: event.markIndex % maxNumber,
      colorIndex: color,
      iconIndex: iconData,
    );

    markMap[event.markIndex] = data;
    makeDataHistoryList.add(event.markIndex);

    final gameFinishData = checkGameState();

    if (gameFinishData.isFinish) {
      streamSubscription?.cancel();
      winnerPlayer = gameFinishData.winnerPlayer;

      emit(GameFinished(winnerPlayer: gameFinishData.winnerPlayer));
    }

    currentPlayer = currentPlayer == 1 ? 2 : 1;

    emit(GameMarkChecked(
      currentPlayerNumber: currentPlayer,
      markMap: markMap,
      firstPlayerUndoCount: firstPlayerUndoCount,
      secondPlayerUndoCount: secondPlayerUndoCount,
    ));
  }

  FutureOr<void> _onGameUndoRequested(
    GameUndoRequested event,
    Emitter<GameState> emit,
  ) {
    if (makeDataHistoryList.isEmpty) {
      return null;
    }

    runTimer();

    if (currentPlayer == 1) {
      if (event.playerNumber == 1) {
        if (firstPlayerUndoCount == 0) {
          return null;
        }

        if (makeDataHistoryList.length < 2) {
          return null;
        }

        firstPlayerUndoCount -= 1;
        final data1 = makeDataHistoryList.removeLast();
        markMap.remove(data1);
        final data2 = makeDataHistoryList.removeLast();
        markMap.remove(data2);
      } else {
        if (secondPlayerUndoCount == 0) {
          return null;
        }

        secondPlayerUndoCount -= 1;

        final data = makeDataHistoryList.removeLast();
        markMap.remove(data);

        currentPlayer = 2;
      }
    } else {
      if (event.playerNumber == 1) {
        if (firstPlayerUndoCount == 0) {
          return null;
        }

        firstPlayerUndoCount -= 1;

        final data = makeDataHistoryList.removeLast();
        markMap.remove(data);

        currentPlayer = 1;
      } else {
        if (secondPlayerUndoCount == 0) {
          return null;
        }

        if (makeDataHistoryList.length < 2) {
          return null;
        }

        secondPlayerUndoCount -= 1;

        final data1 = makeDataHistoryList.removeLast();
        markMap.remove(data1);
        final data2 = makeDataHistoryList.removeLast();
        markMap.remove(data2);
      }
    }

    emit(GameMarkChecked(
      currentPlayerNumber: currentPlayer,
      markMap: markMap,
      firstPlayerUndoCount: firstPlayerUndoCount,
      secondPlayerUndoCount: secondPlayerUndoCount,
    ));
  }

  FutureOr<void> _onGameRandomPlayed(
    GameRandomPlayed event,
    Emitter<GameState> emit,
  ) {
    final indexList = [];

    for (int i = 0; i < maxNumber * maxNumber; i++) {
      if (markMap[i] == null) {
        indexList.add(i);
      }
    }

    if (indexList.isEmpty) {
      return null;
    }

    final randomIndex = Random().nextInt(indexList.length);
    add(GamePlayed(markIndex: indexList[randomIndex], playerNumber: currentPlayer));
  }

  ({bool isFinish, int? winnerPlayer}) checkGameState() {
    bool isWin = true;

    for (int row = 0; row < maxNumber; row++) {
      isWin = true;

      for (int col = 0; col < maxNumber; col++) {
        if (markMap[row * maxNumber + col]?.playerNumber != currentPlayer) {
          isWin = false;

          break;
        }
      }

      if (isWin) {
        return (isFinish: true, winnerPlayer: currentPlayer);
      }
    }

    for (int col = 0; col < maxNumber; col++) {
      isWin = true;
      for (int row = 0; row < maxNumber; row++) {
        if (markMap[row * maxNumber + col]?.playerNumber != currentPlayer) {
          isWin = false;

          break;
        }
      }

      if (isWin) {
        return (isFinish: true, winnerPlayer: currentPlayer);
      }
    }

    isWin = true;

    for (int i = 0; i < maxNumber; i++) {
      if (markMap[i * maxNumber + i]?.playerNumber != currentPlayer) {
        isWin = false;

        break;
      }
    }

    if (isWin) {
      return (isFinish: true, winnerPlayer: currentPlayer);
    }

    isWin = true;

    for (int i = 0; i < maxNumber; i++) {
      if (markMap[i * maxNumber + (maxNumber - 1 - i)]?.playerNumber != currentPlayer) {
        isWin = false;

        break;
      }
    }

    if (isWin) {
      return (isFinish: true, winnerPlayer: currentPlayer);
    }

    if (makeDataHistoryList.length == maxNumber * maxNumber) {
      return (isFinish: true, winnerPlayer: null);
    }

    return (isFinish: false, winnerPlayer: null);
  }

  FutureOr<void> _onGameSaveRequested(
    GameSaveRequested event,
    Emitter<GameState> emit,
  ) async {
    emit(const GameLoading());

    try {
      List<MarkOrderData> markDataList = List.generate(maxNumber * maxNumber, (index) => const MarkOrderData());

      for (int i = 0; i < makeDataHistoryList.length; i++) {
        final data = markMap[makeDataHistoryList[i]]!;
        final cur = data.rowNumber * maxNumber + data.columnNumber;
        markDataList[cur] = MarkOrderData(order: i, markData: data);
      }

      final gameRecord = GameRecord(
        firstPlayerColorIndex: firstPlayerColorIndex,
        secondPlayerColorIndex: secondPlayerColorIndex,
        firstPlayerIconIndex: firstPlayerIconIndex,
        secondPlayerIconIndex: secondPlayerIconIndex,
        markDataList: [...markDataList],
        createdAt: DateTime.now(),
        winnerPlayer: winnerPlayer,
        maxNumber: maxNumber,
      );

      await appLocalDatasource.saveGameRecord(gameRecord);

      emit(const GameSaveSucceed());
    } catch (_) {
      emit(const GameSaveError());
    }
  }
}
