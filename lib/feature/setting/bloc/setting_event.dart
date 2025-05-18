part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object?> get props => [];
}

final class SettingMaxNumberChanged extends SettingEvent {
  const SettingMaxNumberChanged({required this.maxNumber});

  final int maxNumber;

  @override
  List<Object?> get props => [maxNumber];
}

final class SettingPlayerIconChanged extends SettingEvent {
  const SettingPlayerIconChanged({
    required this.playerNumber,
    required this.iconIndex,
  });

  final int playerNumber;
  final int iconIndex;

  @override
  List<Object?> get props => [playerNumber, iconIndex];
}

final class SettingPlayerColorChanged extends SettingEvent {
  const SettingPlayerColorChanged({
    required this.playerNumber,
    required this.colorIndex,
  });

  final int playerNumber;
  final int colorIndex;

  @override
  List<Object?> get props => [playerNumber, colorIndex];
}

final class SettingPlayerOrderChanged extends SettingEvent {
  const SettingPlayerOrderChanged({required this.firstNumber});

  final int firstNumber;

  @override
  List<Object?> get props => [firstNumber];
}
