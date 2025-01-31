// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countdown_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountdownEvent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  bool get isRepeating => throw _privateConstructorUsedError;
  RepeatConfiguration? get repeatConfig => throw _privateConstructorUsedError;

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountdownEventCopyWith<CountdownEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountdownEventCopyWith<$Res> {
  factory $CountdownEventCopyWith(
          CountdownEvent value, $Res Function(CountdownEvent) then) =
      _$CountdownEventCopyWithImpl<$Res, CountdownEvent>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? notes,
      String? iconName,
      DateTime dateTime,
      List<String> tags,
      String timezone,
      bool isRepeating,
      RepeatConfiguration? repeatConfig});

  $RepeatConfigurationCopyWith<$Res>? get repeatConfig;
}

/// @nodoc
class _$CountdownEventCopyWithImpl<$Res, $Val extends CountdownEvent>
    implements $CountdownEventCopyWith<$Res> {
  _$CountdownEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? notes = freezed,
    Object? iconName = freezed,
    Object? dateTime = null,
    Object? tags = null,
    Object? timezone = null,
    Object? isRepeating = null,
    Object? repeatConfig = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      isRepeating: null == isRepeating
          ? _value.isRepeating
          : isRepeating // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatConfig: freezed == repeatConfig
          ? _value.repeatConfig
          : repeatConfig // ignore: cast_nullable_to_non_nullable
              as RepeatConfiguration?,
    ) as $Val);
  }

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeatConfigurationCopyWith<$Res>? get repeatConfig {
    if (_value.repeatConfig == null) {
      return null;
    }

    return $RepeatConfigurationCopyWith<$Res>(_value.repeatConfig!, (value) {
      return _then(_value.copyWith(repeatConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CountdownEventImplCopyWith<$Res>
    implements $CountdownEventCopyWith<$Res> {
  factory _$$CountdownEventImplCopyWith(_$CountdownEventImpl value,
          $Res Function(_$CountdownEventImpl) then) =
      __$$CountdownEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? notes,
      String? iconName,
      DateTime dateTime,
      List<String> tags,
      String timezone,
      bool isRepeating,
      RepeatConfiguration? repeatConfig});

  @override
  $RepeatConfigurationCopyWith<$Res>? get repeatConfig;
}

/// @nodoc
class __$$CountdownEventImplCopyWithImpl<$Res>
    extends _$CountdownEventCopyWithImpl<$Res, _$CountdownEventImpl>
    implements _$$CountdownEventImplCopyWith<$Res> {
  __$$CountdownEventImplCopyWithImpl(
      _$CountdownEventImpl _value, $Res Function(_$CountdownEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? notes = freezed,
    Object? iconName = freezed,
    Object? dateTime = null,
    Object? tags = null,
    Object? timezone = null,
    Object? isRepeating = null,
    Object? repeatConfig = freezed,
  }) {
    return _then(_$CountdownEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      isRepeating: null == isRepeating
          ? _value.isRepeating
          : isRepeating // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatConfig: freezed == repeatConfig
          ? _value.repeatConfig
          : repeatConfig // ignore: cast_nullable_to_non_nullable
              as RepeatConfiguration?,
    ));
  }
}

/// @nodoc

class _$CountdownEventImpl implements _CountdownEvent {
  const _$CountdownEventImpl(
      {required this.id,
      required this.name,
      this.notes,
      this.iconName,
      required this.dateTime,
      final List<String> tags = const [],
      required this.timezone,
      this.isRepeating = false,
      this.repeatConfig})
      : _tags = tags;

  @override
  final String id;
  @override
  final String name;
  @override
  final String? notes;
  @override
  final String? iconName;
  @override
  final DateTime dateTime;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String timezone;
  @override
  @JsonKey()
  final bool isRepeating;
  @override
  final RepeatConfiguration? repeatConfig;

  @override
  String toString() {
    return 'CountdownEvent(id: $id, name: $name, notes: $notes, iconName: $iconName, dateTime: $dateTime, tags: $tags, timezone: $timezone, isRepeating: $isRepeating, repeatConfig: $repeatConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountdownEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.isRepeating, isRepeating) ||
                other.isRepeating == isRepeating) &&
            (identical(other.repeatConfig, repeatConfig) ||
                other.repeatConfig == repeatConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      notes,
      iconName,
      dateTime,
      const DeepCollectionEquality().hash(_tags),
      timezone,
      isRepeating,
      repeatConfig);

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountdownEventImplCopyWith<_$CountdownEventImpl> get copyWith =>
      __$$CountdownEventImplCopyWithImpl<_$CountdownEventImpl>(
          this, _$identity);
}

abstract class _CountdownEvent implements CountdownEvent {
  const factory _CountdownEvent(
      {required final String id,
      required final String name,
      final String? notes,
      final String? iconName,
      required final DateTime dateTime,
      final List<String> tags,
      required final String timezone,
      final bool isRepeating,
      final RepeatConfiguration? repeatConfig}) = _$CountdownEventImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get notes;
  @override
  String? get iconName;
  @override
  DateTime get dateTime;
  @override
  List<String> get tags;
  @override
  String get timezone;
  @override
  bool get isRepeating;
  @override
  RepeatConfiguration? get repeatConfig;

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountdownEventImplCopyWith<_$CountdownEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
