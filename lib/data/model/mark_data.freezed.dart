// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarkData {
  @HiveField(0)
  int get playerNumber => throw _privateConstructorUsedError;
  @HiveField(1)
  int get rowNumber => throw _privateConstructorUsedError;
  @HiveField(2)
  int get columnNumber => throw _privateConstructorUsedError;
  @HiveField(3)
  int get colorIndex => throw _privateConstructorUsedError;
  @HiveField(4)
  int get iconIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarkDataCopyWith<MarkData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkDataCopyWith<$Res> {
  factory $MarkDataCopyWith(MarkData value, $Res Function(MarkData) then) =
      _$MarkDataCopyWithImpl<$Res, MarkData>;
  @useResult
  $Res call(
      {@HiveField(0) int playerNumber,
      @HiveField(1) int rowNumber,
      @HiveField(2) int columnNumber,
      @HiveField(3) int colorIndex,
      @HiveField(4) int iconIndex});
}

/// @nodoc
class _$MarkDataCopyWithImpl<$Res, $Val extends MarkData>
    implements $MarkDataCopyWith<$Res> {
  _$MarkDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerNumber = null,
    Object? rowNumber = null,
    Object? columnNumber = null,
    Object? colorIndex = null,
    Object? iconIndex = null,
  }) {
    return _then(_value.copyWith(
      playerNumber: null == playerNumber
          ? _value.playerNumber
          : playerNumber // ignore: cast_nullable_to_non_nullable
              as int,
      rowNumber: null == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int,
      columnNumber: null == columnNumber
          ? _value.columnNumber
          : columnNumber // ignore: cast_nullable_to_non_nullable
              as int,
      colorIndex: null == colorIndex
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      iconIndex: null == iconIndex
          ? _value.iconIndex
          : iconIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkDataImplCopyWith<$Res>
    implements $MarkDataCopyWith<$Res> {
  factory _$$MarkDataImplCopyWith(
          _$MarkDataImpl value, $Res Function(_$MarkDataImpl) then) =
      __$$MarkDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int playerNumber,
      @HiveField(1) int rowNumber,
      @HiveField(2) int columnNumber,
      @HiveField(3) int colorIndex,
      @HiveField(4) int iconIndex});
}

/// @nodoc
class __$$MarkDataImplCopyWithImpl<$Res>
    extends _$MarkDataCopyWithImpl<$Res, _$MarkDataImpl>
    implements _$$MarkDataImplCopyWith<$Res> {
  __$$MarkDataImplCopyWithImpl(
      _$MarkDataImpl _value, $Res Function(_$MarkDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerNumber = null,
    Object? rowNumber = null,
    Object? columnNumber = null,
    Object? colorIndex = null,
    Object? iconIndex = null,
  }) {
    return _then(_$MarkDataImpl(
      playerNumber: null == playerNumber
          ? _value.playerNumber
          : playerNumber // ignore: cast_nullable_to_non_nullable
              as int,
      rowNumber: null == rowNumber
          ? _value.rowNumber
          : rowNumber // ignore: cast_nullable_to_non_nullable
              as int,
      columnNumber: null == columnNumber
          ? _value.columnNumber
          : columnNumber // ignore: cast_nullable_to_non_nullable
              as int,
      colorIndex: null == colorIndex
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      iconIndex: null == iconIndex
          ? _value.iconIndex
          : iconIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2)
class _$MarkDataImpl implements _MarkData {
  const _$MarkDataImpl(
      {@HiveField(0) required this.playerNumber,
      @HiveField(1) required this.rowNumber,
      @HiveField(2) required this.columnNumber,
      @HiveField(3) required this.colorIndex,
      @HiveField(4) required this.iconIndex});

  @override
  @HiveField(0)
  final int playerNumber;
  @override
  @HiveField(1)
  final int rowNumber;
  @override
  @HiveField(2)
  final int columnNumber;
  @override
  @HiveField(3)
  final int colorIndex;
  @override
  @HiveField(4)
  final int iconIndex;

  @override
  String toString() {
    return 'MarkData(playerNumber: $playerNumber, rowNumber: $rowNumber, columnNumber: $columnNumber, colorIndex: $colorIndex, iconIndex: $iconIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkDataImpl &&
            (identical(other.playerNumber, playerNumber) ||
                other.playerNumber == playerNumber) &&
            (identical(other.rowNumber, rowNumber) ||
                other.rowNumber == rowNumber) &&
            (identical(other.columnNumber, columnNumber) ||
                other.columnNumber == columnNumber) &&
            (identical(other.colorIndex, colorIndex) ||
                other.colorIndex == colorIndex) &&
            (identical(other.iconIndex, iconIndex) ||
                other.iconIndex == iconIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerNumber, rowNumber,
      columnNumber, colorIndex, iconIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkDataImplCopyWith<_$MarkDataImpl> get copyWith =>
      __$$MarkDataImplCopyWithImpl<_$MarkDataImpl>(this, _$identity);
}

abstract class _MarkData implements MarkData {
  const factory _MarkData(
      {@HiveField(0) required final int playerNumber,
      @HiveField(1) required final int rowNumber,
      @HiveField(2) required final int columnNumber,
      @HiveField(3) required final int colorIndex,
      @HiveField(4) required final int iconIndex}) = _$MarkDataImpl;

  @override
  @HiveField(0)
  int get playerNumber;
  @override
  @HiveField(1)
  int get rowNumber;
  @override
  @HiveField(2)
  int get columnNumber;
  @override
  @HiveField(3)
  int get colorIndex;
  @override
  @HiveField(4)
  int get iconIndex;
  @override
  @JsonKey(ignore: true)
  _$$MarkDataImplCopyWith<_$MarkDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
