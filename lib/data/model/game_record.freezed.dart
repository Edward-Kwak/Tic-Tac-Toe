// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameRecord {
  @HiveField(0)
  int? get winnerPlayer => throw _privateConstructorUsedError;
  @HiveField(1)
  int get firstPlayerColorIndex => throw _privateConstructorUsedError;
  @HiveField(2)
  int get secondPlayerColorIndex => throw _privateConstructorUsedError;
  @HiveField(3)
  int get firstPlayerIconIndex => throw _privateConstructorUsedError;
  @HiveField(4)
  int get secondPlayerIconIndex => throw _privateConstructorUsedError;
  @HiveField(5)
  List<MarkData> get markDataList => throw _privateConstructorUsedError;
  @HiveField(6)
  int get maxNumber => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameRecordCopyWith<GameRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRecordCopyWith<$Res> {
  factory $GameRecordCopyWith(
          GameRecord value, $Res Function(GameRecord) then) =
      _$GameRecordCopyWithImpl<$Res, GameRecord>;
  @useResult
  $Res call(
      {@HiveField(0) int? winnerPlayer,
      @HiveField(1) int firstPlayerColorIndex,
      @HiveField(2) int secondPlayerColorIndex,
      @HiveField(3) int firstPlayerIconIndex,
      @HiveField(4) int secondPlayerIconIndex,
      @HiveField(5) List<MarkData> markDataList,
      @HiveField(6) int maxNumber,
      @HiveField(7) DateTime createdAt});
}

/// @nodoc
class _$GameRecordCopyWithImpl<$Res, $Val extends GameRecord>
    implements $GameRecordCopyWith<$Res> {
  _$GameRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winnerPlayer = freezed,
    Object? firstPlayerColorIndex = null,
    Object? secondPlayerColorIndex = null,
    Object? firstPlayerIconIndex = null,
    Object? secondPlayerIconIndex = null,
    Object? markDataList = null,
    Object? maxNumber = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      winnerPlayer: freezed == winnerPlayer
          ? _value.winnerPlayer
          : winnerPlayer // ignore: cast_nullable_to_non_nullable
              as int?,
      firstPlayerColorIndex: null == firstPlayerColorIndex
          ? _value.firstPlayerColorIndex
          : firstPlayerColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      secondPlayerColorIndex: null == secondPlayerColorIndex
          ? _value.secondPlayerColorIndex
          : secondPlayerColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      firstPlayerIconIndex: null == firstPlayerIconIndex
          ? _value.firstPlayerIconIndex
          : firstPlayerIconIndex // ignore: cast_nullable_to_non_nullable
              as int,
      secondPlayerIconIndex: null == secondPlayerIconIndex
          ? _value.secondPlayerIconIndex
          : secondPlayerIconIndex // ignore: cast_nullable_to_non_nullable
              as int,
      markDataList: null == markDataList
          ? _value.markDataList
          : markDataList // ignore: cast_nullable_to_non_nullable
              as List<MarkData>,
      maxNumber: null == maxNumber
          ? _value.maxNumber
          : maxNumber // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameRecordImplCopyWith<$Res>
    implements $GameRecordCopyWith<$Res> {
  factory _$$GameRecordImplCopyWith(
          _$GameRecordImpl value, $Res Function(_$GameRecordImpl) then) =
      __$$GameRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? winnerPlayer,
      @HiveField(1) int firstPlayerColorIndex,
      @HiveField(2) int secondPlayerColorIndex,
      @HiveField(3) int firstPlayerIconIndex,
      @HiveField(4) int secondPlayerIconIndex,
      @HiveField(5) List<MarkData> markDataList,
      @HiveField(6) int maxNumber,
      @HiveField(7) DateTime createdAt});
}

/// @nodoc
class __$$GameRecordImplCopyWithImpl<$Res>
    extends _$GameRecordCopyWithImpl<$Res, _$GameRecordImpl>
    implements _$$GameRecordImplCopyWith<$Res> {
  __$$GameRecordImplCopyWithImpl(
      _$GameRecordImpl _value, $Res Function(_$GameRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winnerPlayer = freezed,
    Object? firstPlayerColorIndex = null,
    Object? secondPlayerColorIndex = null,
    Object? firstPlayerIconIndex = null,
    Object? secondPlayerIconIndex = null,
    Object? markDataList = null,
    Object? maxNumber = null,
    Object? createdAt = null,
  }) {
    return _then(_$GameRecordImpl(
      winnerPlayer: freezed == winnerPlayer
          ? _value.winnerPlayer
          : winnerPlayer // ignore: cast_nullable_to_non_nullable
              as int?,
      firstPlayerColorIndex: null == firstPlayerColorIndex
          ? _value.firstPlayerColorIndex
          : firstPlayerColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      secondPlayerColorIndex: null == secondPlayerColorIndex
          ? _value.secondPlayerColorIndex
          : secondPlayerColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      firstPlayerIconIndex: null == firstPlayerIconIndex
          ? _value.firstPlayerIconIndex
          : firstPlayerIconIndex // ignore: cast_nullable_to_non_nullable
              as int,
      secondPlayerIconIndex: null == secondPlayerIconIndex
          ? _value.secondPlayerIconIndex
          : secondPlayerIconIndex // ignore: cast_nullable_to_non_nullable
              as int,
      markDataList: null == markDataList
          ? _value._markDataList
          : markDataList // ignore: cast_nullable_to_non_nullable
              as List<MarkData>,
      maxNumber: null == maxNumber
          ? _value.maxNumber
          : maxNumber // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1)
class _$GameRecordImpl implements _GameRecord {
  const _$GameRecordImpl(
      {@HiveField(0) this.winnerPlayer,
      @HiveField(1) required this.firstPlayerColorIndex,
      @HiveField(2) required this.secondPlayerColorIndex,
      @HiveField(3) required this.firstPlayerIconIndex,
      @HiveField(4) required this.secondPlayerIconIndex,
      @HiveField(5) required final List<MarkData> markDataList,
      @HiveField(6) required this.maxNumber,
      @HiveField(7) required this.createdAt})
      : _markDataList = markDataList;

  @override
  @HiveField(0)
  final int? winnerPlayer;
  @override
  @HiveField(1)
  final int firstPlayerColorIndex;
  @override
  @HiveField(2)
  final int secondPlayerColorIndex;
  @override
  @HiveField(3)
  final int firstPlayerIconIndex;
  @override
  @HiveField(4)
  final int secondPlayerIconIndex;
  final List<MarkData> _markDataList;
  @override
  @HiveField(5)
  List<MarkData> get markDataList {
    if (_markDataList is EqualUnmodifiableListView) return _markDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markDataList);
  }

  @override
  @HiveField(6)
  final int maxNumber;
  @override
  @HiveField(7)
  final DateTime createdAt;

  @override
  String toString() {
    return 'GameRecord(winnerPlayer: $winnerPlayer, firstPlayerColorIndex: $firstPlayerColorIndex, secondPlayerColorIndex: $secondPlayerColorIndex, firstPlayerIconIndex: $firstPlayerIconIndex, secondPlayerIconIndex: $secondPlayerIconIndex, markDataList: $markDataList, maxNumber: $maxNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRecordImpl &&
            (identical(other.winnerPlayer, winnerPlayer) ||
                other.winnerPlayer == winnerPlayer) &&
            (identical(other.firstPlayerColorIndex, firstPlayerColorIndex) ||
                other.firstPlayerColorIndex == firstPlayerColorIndex) &&
            (identical(other.secondPlayerColorIndex, secondPlayerColorIndex) ||
                other.secondPlayerColorIndex == secondPlayerColorIndex) &&
            (identical(other.firstPlayerIconIndex, firstPlayerIconIndex) ||
                other.firstPlayerIconIndex == firstPlayerIconIndex) &&
            (identical(other.secondPlayerIconIndex, secondPlayerIconIndex) ||
                other.secondPlayerIconIndex == secondPlayerIconIndex) &&
            const DeepCollectionEquality()
                .equals(other._markDataList, _markDataList) &&
            (identical(other.maxNumber, maxNumber) ||
                other.maxNumber == maxNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      winnerPlayer,
      firstPlayerColorIndex,
      secondPlayerColorIndex,
      firstPlayerIconIndex,
      secondPlayerIconIndex,
      const DeepCollectionEquality().hash(_markDataList),
      maxNumber,
      createdAt);

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRecordImplCopyWith<_$GameRecordImpl> get copyWith =>
      __$$GameRecordImplCopyWithImpl<_$GameRecordImpl>(this, _$identity);
}

abstract class _GameRecord implements GameRecord {
  const factory _GameRecord(
      {@HiveField(0) final int? winnerPlayer,
      @HiveField(1) required final int firstPlayerColorIndex,
      @HiveField(2) required final int secondPlayerColorIndex,
      @HiveField(3) required final int firstPlayerIconIndex,
      @HiveField(4) required final int secondPlayerIconIndex,
      @HiveField(5) required final List<MarkData> markDataList,
      @HiveField(6) required final int maxNumber,
      @HiveField(7) required final DateTime createdAt}) = _$GameRecordImpl;

  @override
  @HiveField(0)
  int? get winnerPlayer;
  @override
  @HiveField(1)
  int get firstPlayerColorIndex;
  @override
  @HiveField(2)
  int get secondPlayerColorIndex;
  @override
  @HiveField(3)
  int get firstPlayerIconIndex;
  @override
  @HiveField(4)
  int get secondPlayerIconIndex;
  @override
  @HiveField(5)
  List<MarkData> get markDataList;
  @override
  @HiveField(6)
  int get maxNumber;
  @override
  @HiveField(7)
  DateTime get createdAt;

  /// Create a copy of GameRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameRecordImplCopyWith<_$GameRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
