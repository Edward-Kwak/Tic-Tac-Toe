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
  int get playerNumber => throw _privateConstructorUsedError;
  int get rowNumber => throw _privateConstructorUsedError;
  int get columnNumber => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  IconData get iconData => throw _privateConstructorUsedError;

  /// Create a copy of MarkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarkDataCopyWith<MarkData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkDataCopyWith<$Res> {
  factory $MarkDataCopyWith(MarkData value, $Res Function(MarkData) then) =
      _$MarkDataCopyWithImpl<$Res, MarkData>;
  @useResult
  $Res call(
      {int playerNumber,
      int rowNumber,
      int columnNumber,
      Color color,
      IconData iconData});
}

/// @nodoc
class _$MarkDataCopyWithImpl<$Res, $Val extends MarkData>
    implements $MarkDataCopyWith<$Res> {
  _$MarkDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerNumber = null,
    Object? rowNumber = null,
    Object? columnNumber = null,
    Object? color = null,
    Object? iconData = null,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
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
      {int playerNumber,
      int rowNumber,
      int columnNumber,
      Color color,
      IconData iconData});
}

/// @nodoc
class __$$MarkDataImplCopyWithImpl<$Res>
    extends _$MarkDataCopyWithImpl<$Res, _$MarkDataImpl>
    implements _$$MarkDataImplCopyWith<$Res> {
  __$$MarkDataImplCopyWithImpl(
      _$MarkDataImpl _value, $Res Function(_$MarkDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerNumber = null,
    Object? rowNumber = null,
    Object? columnNumber = null,
    Object? color = null,
    Object? iconData = null,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc

class _$MarkDataImpl implements _MarkData {
  const _$MarkDataImpl(
      {required this.playerNumber,
      required this.rowNumber,
      required this.columnNumber,
      required this.color,
      required this.iconData});

  @override
  final int playerNumber;
  @override
  final int rowNumber;
  @override
  final int columnNumber;
  @override
  final Color color;
  @override
  final IconData iconData;

  @override
  String toString() {
    return 'MarkData(playerNumber: $playerNumber, rowNumber: $rowNumber, columnNumber: $columnNumber, color: $color, iconData: $iconData)';
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
            (identical(other.color, color) || other.color == color) &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, playerNumber, rowNumber, columnNumber, color, iconData);

  /// Create a copy of MarkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkDataImplCopyWith<_$MarkDataImpl> get copyWith =>
      __$$MarkDataImplCopyWithImpl<_$MarkDataImpl>(this, _$identity);
}

abstract class _MarkData implements MarkData {
  const factory _MarkData(
      {required final int playerNumber,
      required final int rowNumber,
      required final int columnNumber,
      required final Color color,
      required final IconData iconData}) = _$MarkDataImpl;

  @override
  int get playerNumber;
  @override
  int get rowNumber;
  @override
  int get columnNumber;
  @override
  Color get color;
  @override
  IconData get iconData;

  /// Create a copy of MarkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkDataImplCopyWith<_$MarkDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
