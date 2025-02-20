// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_timing_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventTimingDetails _$EventTimingDetailsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'oneTime':
      return OneTimeEventTiming.fromJson(json);
    case 'recurring':
      return RecurringEventTiming.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'EventTimingDetails',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$EventTimingDetails {
  String? get timeZone => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime eventTime, String timeZone) oneTime,
    required TResult Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)
        recurring,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime eventTime, String timeZone)? oneTime,
    TResult? Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)?
        recurring,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime eventTime, String timeZone)? oneTime,
    TResult Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)?
        recurring,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneTimeEventTiming value) oneTime,
    required TResult Function(RecurringEventTiming value) recurring,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneTimeEventTiming value)? oneTime,
    TResult? Function(RecurringEventTiming value)? recurring,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneTimeEventTiming value)? oneTime,
    TResult Function(RecurringEventTiming value)? recurring,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this EventTimingDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventTimingDetailsCopyWith<EventTimingDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTimingDetailsCopyWith<$Res> {
  factory $EventTimingDetailsCopyWith(
          EventTimingDetails value, $Res Function(EventTimingDetails) then) =
      _$EventTimingDetailsCopyWithImpl<$Res, EventTimingDetails>;
  @useResult
  $Res call({String timeZone});
}

/// @nodoc
class _$EventTimingDetailsCopyWithImpl<$Res, $Val extends EventTimingDetails>
    implements $EventTimingDetailsCopyWith<$Res> {
  _$EventTimingDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeZone = null,
  }) {
    return _then(_value.copyWith(
      timeZone: null == timeZone
          ? _value.timeZone!
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OneTimeEventTimingImplCopyWith<$Res>
    implements $EventTimingDetailsCopyWith<$Res> {
  factory _$$OneTimeEventTimingImplCopyWith(_$OneTimeEventTimingImpl value,
          $Res Function(_$OneTimeEventTimingImpl) then) =
      __$$OneTimeEventTimingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime eventTime, String timeZone});
}

/// @nodoc
class __$$OneTimeEventTimingImplCopyWithImpl<$Res>
    extends _$EventTimingDetailsCopyWithImpl<$Res, _$OneTimeEventTimingImpl>
    implements _$$OneTimeEventTimingImplCopyWith<$Res> {
  __$$OneTimeEventTimingImplCopyWithImpl(_$OneTimeEventTimingImpl _value,
      $Res Function(_$OneTimeEventTimingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventTime = null,
    Object? timeZone = null,
  }) {
    return _then(_$OneTimeEventTimingImpl(
      eventTime: null == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OneTimeEventTimingImpl implements OneTimeEventTiming {
  const _$OneTimeEventTimingImpl(
      {required this.eventTime, required this.timeZone, final String? $type})
      : $type = $type ?? 'oneTime';

  factory _$OneTimeEventTimingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneTimeEventTimingImplFromJson(json);

  @override
  final DateTime eventTime;
  @override
  final String timeZone;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventTimingDetails.oneTime(eventTime: $eventTime, timeZone: $timeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneTimeEventTimingImpl &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventTime, timeZone);

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OneTimeEventTimingImplCopyWith<_$OneTimeEventTimingImpl> get copyWith =>
      __$$OneTimeEventTimingImplCopyWithImpl<_$OneTimeEventTimingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime eventTime, String timeZone) oneTime,
    required TResult Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)
        recurring,
  }) {
    return oneTime(eventTime, timeZone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime eventTime, String timeZone)? oneTime,
    TResult? Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)?
        recurring,
  }) {
    return oneTime?.call(eventTime, timeZone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime eventTime, String timeZone)? oneTime,
    TResult Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)?
        recurring,
    required TResult orElse(),
  }) {
    if (oneTime != null) {
      return oneTime(eventTime, timeZone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneTimeEventTiming value) oneTime,
    required TResult Function(RecurringEventTiming value) recurring,
  }) {
    return oneTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneTimeEventTiming value)? oneTime,
    TResult? Function(RecurringEventTiming value)? recurring,
  }) {
    return oneTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneTimeEventTiming value)? oneTime,
    TResult Function(RecurringEventTiming value)? recurring,
    required TResult orElse(),
  }) {
    if (oneTime != null) {
      return oneTime(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OneTimeEventTimingImplToJson(
      this,
    );
  }
}

abstract class OneTimeEventTiming implements EventTimingDetails {
  const factory OneTimeEventTiming(
      {required final DateTime eventTime,
      required final String timeZone}) = _$OneTimeEventTimingImpl;

  factory OneTimeEventTiming.fromJson(Map<String, dynamic> json) =
      _$OneTimeEventTimingImpl.fromJson;

  DateTime get eventTime;
  @override
  String get timeZone;

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OneTimeEventTimingImplCopyWith<_$OneTimeEventTimingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecurringEventTimingImplCopyWith<$Res>
    implements $EventTimingDetailsCopyWith<$Res> {
  factory _$$RecurringEventTimingImplCopyWith(_$RecurringEventTimingImpl value,
          $Res Function(_$RecurringEventTimingImpl) then) =
      __$$RecurringEventTimingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecurrencePattern pattern,
      @TimeOfDayConverter() TimeOfDay timeOfDay,
      Set<int> daysOfWeek,
      String? timeZone});

  $RecurrencePatternCopyWith<$Res> get pattern;
}

/// @nodoc
class __$$RecurringEventTimingImplCopyWithImpl<$Res>
    extends _$EventTimingDetailsCopyWithImpl<$Res, _$RecurringEventTimingImpl>
    implements _$$RecurringEventTimingImplCopyWith<$Res> {
  __$$RecurringEventTimingImplCopyWithImpl(_$RecurringEventTimingImpl _value,
      $Res Function(_$RecurringEventTimingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pattern = null,
    Object? timeOfDay = null,
    Object? daysOfWeek = null,
    Object? timeZone = freezed,
  }) {
    return _then(_$RecurringEventTimingImpl(
      pattern: null == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as RecurrencePattern,
      timeOfDay: null == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      daysOfWeek: null == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecurrencePatternCopyWith<$Res> get pattern {
    return $RecurrencePatternCopyWith<$Res>(_value.pattern, (value) {
      return _then(_value.copyWith(pattern: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurringEventTimingImpl implements RecurringEventTiming {
  const _$RecurringEventTimingImpl(
      {required this.pattern,
      @TimeOfDayConverter() required this.timeOfDay,
      required final Set<int> daysOfWeek,
      this.timeZone,
      final String? $type})
      : _daysOfWeek = daysOfWeek,
        $type = $type ?? 'recurring';

  factory _$RecurringEventTimingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringEventTimingImplFromJson(json);

  @override
  final RecurrencePattern pattern;
  @override
  @TimeOfDayConverter()
  final TimeOfDay timeOfDay;
  final Set<int> _daysOfWeek;
  @override
  Set<int> get daysOfWeek {
    if (_daysOfWeek is EqualUnmodifiableSetView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_daysOfWeek);
  }

  @override
  final String? timeZone;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EventTimingDetails.recurring(pattern: $pattern, timeOfDay: $timeOfDay, daysOfWeek: $daysOfWeek, timeZone: $timeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringEventTimingImpl &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pattern, timeOfDay,
      const DeepCollectionEquality().hash(_daysOfWeek), timeZone);

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringEventTimingImplCopyWith<_$RecurringEventTimingImpl>
      get copyWith =>
          __$$RecurringEventTimingImplCopyWithImpl<_$RecurringEventTimingImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime eventTime, String timeZone) oneTime,
    required TResult Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)
        recurring,
  }) {
    return recurring(pattern, timeOfDay, daysOfWeek, timeZone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime eventTime, String timeZone)? oneTime,
    TResult? Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)?
        recurring,
  }) {
    return recurring?.call(pattern, timeOfDay, daysOfWeek, timeZone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime eventTime, String timeZone)? oneTime,
    TResult Function(
            RecurrencePattern pattern,
            @TimeOfDayConverter() TimeOfDay timeOfDay,
            Set<int> daysOfWeek,
            String? timeZone)?
        recurring,
    required TResult orElse(),
  }) {
    if (recurring != null) {
      return recurring(pattern, timeOfDay, daysOfWeek, timeZone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneTimeEventTiming value) oneTime,
    required TResult Function(RecurringEventTiming value) recurring,
  }) {
    return recurring(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneTimeEventTiming value)? oneTime,
    TResult? Function(RecurringEventTiming value)? recurring,
  }) {
    return recurring?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneTimeEventTiming value)? oneTime,
    TResult Function(RecurringEventTiming value)? recurring,
    required TResult orElse(),
  }) {
    if (recurring != null) {
      return recurring(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringEventTimingImplToJson(
      this,
    );
  }
}

abstract class RecurringEventTiming implements EventTimingDetails {
  const factory RecurringEventTiming(
      {required final RecurrencePattern pattern,
      @TimeOfDayConverter() required final TimeOfDay timeOfDay,
      required final Set<int> daysOfWeek,
      final String? timeZone}) = _$RecurringEventTimingImpl;

  factory RecurringEventTiming.fromJson(Map<String, dynamic> json) =
      _$RecurringEventTimingImpl.fromJson;

  RecurrencePattern get pattern;
  @TimeOfDayConverter()
  TimeOfDay get timeOfDay;
  Set<int> get daysOfWeek;
  @override
  String? get timeZone;

  /// Create a copy of EventTimingDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurringEventTimingImplCopyWith<_$RecurringEventTimingImpl>
      get copyWith => throw _privateConstructorUsedError;
}
