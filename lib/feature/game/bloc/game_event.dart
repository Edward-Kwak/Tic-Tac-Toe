part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

final class GameTimerChanged extends GameEvent {
  const GameTimerChanged({required this.second});

  final int second;

  @override
  List<Object?> get props => [second];
}

final class GamePlayed extends GameEvent {
  const GamePlayed({required this.markIndex, required this.playerNumber});

  final int markIndex;
  final int playerNumber;

  @override
  List<Object?> get props => [markIndex, playerNumber];
}

final class GameRandomPlayed extends GameEvent {
  const GameRandomPlayed();
}

final class GameFinishRequested extends GameEvent {
  const GameFinishRequested();
}

final class GameUndoRequested extends GameEvent {
  const GameUndoRequested({required this.playerNumber});

  final int playerNumber;

  @override
  List<Object?> get props => [playerNumber];
}

final class GameSaveRequested extends GameEvent {
  const GameSaveRequested();
}
