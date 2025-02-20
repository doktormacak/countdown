// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reccurence_pattern.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecurrencePattern _$RecurrencePatternFromJson(Map<String, dynamic> json) {
  return _RecurrencePattern.fromJson(json);
}

/// @nodoc
mixin _$RecurrencePattern {
  RecurrenceType get type => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  int? get occurrences => throw _privateConstructorUsedError;

  /// Serializes this RecurrencePattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecurrencePattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecurrencePatternCopyWith<RecurrencePattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurrencePatternCopyWith<$Res> {
  factory $RecurrencePatternCopyWith(
          RecurrencePattern value, $Res Function(RecurrencePattern) then) =
      _$RecurrencePatternCopyWithImpl<$Res, RecurrencePattern>;
  @useResult
  $Res call(
      {RecurrenceType type, int interval, DateTime? endDate, int? occurrences});
}

/// @nodoc
class _$RecurrencePatternCopyWithImpl<$Res, $Val extends RecurrencePattern>
    implements $RecurrencePatternCopyWith<$Res> {
  _$RecurrencePatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecurrencePattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interval = null,
    Object? endDate = freezed,
    Object? occurrences = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      occurrences: freezed == occurrences
          ? _value.occurrences
          : occurrences // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecurrencePatternImplCopyWith<$Res>
    implements $RecurrencePatternCopyWith<$Res> {
  factory _$$RecurrencePatternImplCopyWith(_$RecurrencePatternImpl value,
          $Res Function(_$RecurrencePatternImpl) then) =
      __$$RecurrencePatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecurrenceType type, int interval, DateTime? endDate, int? occurrences});
}

/// @nodoc
class __$$RecurrencePatternImplCopyWithImpl<$Res>
    extends _$RecurrencePatternCopyWithImpl<$Res, _$RecurrencePatternImpl>
    implements _$$RecurrencePatternImplCopyWith<$Res> {
  __$$RecurrencePatternImplCopyWithImpl(_$RecurrencePatternImpl _value,
      $Res Function(_$RecurrencePatternImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecurrencePattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interval = null,
    Object? endDate = freezed,
    Object? occurrences = freezed,
  }) {
    return _then(_$RecurrencePatternImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      occurrences: freezed == occurrences
          ? _value.occurrences
          : occurrences // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurrencePatternImpl implements _RecurrencePattern {
  const _$RecurrencePatternImpl(
      {required this.type,
      required this.interval,
      this.endDate,
      this.occurrences});

  factory _$RecurrencePatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurrencePatternImplFromJson(json);

  @override
  final RecurrenceType type;
  @override
  final int interval;
  @override
  final DateTime? endDate;
  @override
  final int? occurrences;

  @override
  String toString() {
    return 'RecurrencePattern(type: $type, interval: $interval, endDate: $endDate, occurrences: $occurrences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurrencePatternImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.occurrences, occurrences) ||
                other.occurrences == occurrences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, interval, endDate, occurrences);

  /// Create a copy of RecurrencePattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurrencePatternImplCopyWith<_$RecurrencePatternImpl> get copyWith =>
      __$$RecurrencePatternImplCopyWithImpl<_$RecurrencePatternImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurrencePatternImplToJson(
      this,
    );
  }
}

abstract class _RecurrencePattern implements RecurrencePattern {
  const factory _RecurrencePattern(
      {required final RecurrenceType type,
      required final int interval,
      final DateTime? endDate,
      final int? occurrences}) = _$RecurrencePatternImpl;

  factory _RecurrencePattern.fromJson(Map<String, dynamic> json) =
      _$RecurrencePatternImpl.fromJson;

  @override
  RecurrenceType get type;
  @override
  int get interval;
  @override
  DateTime? get endDate;
  @override
  int? get occurrences;

  /// Create a copy of RecurrencePattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurrencePatternImplCopyWith<_$RecurrencePatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
