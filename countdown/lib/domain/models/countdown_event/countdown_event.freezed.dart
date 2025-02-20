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

CountdownEvent _$CountdownEventFromJson(Map<String, dynamic> json) {
  return _CountdownEvent.fromJson(json);
}

/// @nodoc
mixin _$CountdownEvent {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  EventType get type => throw _privateConstructorUsedError;
  EventTimingDetails get timing => throw _privateConstructorUsedError;
  NotificationSettings get notificationSettings =>
      throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;

  /// Serializes this CountdownEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
      String title,
      String? notes,
      String? iconName,
      DateTime createdAt,
      List<String> tags,
      EventType type,
      EventTimingDetails timing,
      NotificationSettings notificationSettings,
      bool isArchived});

  $EventTimingDetailsCopyWith<$Res> get timing;
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
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
    Object? title = null,
    Object? notes = freezed,
    Object? iconName = freezed,
    Object? createdAt = null,
    Object? tags = null,
    Object? type = null,
    Object? timing = null,
    Object? notificationSettings = null,
    Object? isArchived = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as EventTimingDetails,
      notificationSettings: null == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventTimingDetailsCopyWith<$Res> get timing {
    return $EventTimingDetailsCopyWith<$Res>(_value.timing, (value) {
      return _then(_value.copyWith(timing: value) as $Val);
    });
  }

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res> get notificationSettings {
    return $NotificationSettingsCopyWith<$Res>(_value.notificationSettings,
        (value) {
      return _then(_value.copyWith(notificationSettings: value) as $Val);
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
      String title,
      String? notes,
      String? iconName,
      DateTime createdAt,
      List<String> tags,
      EventType type,
      EventTimingDetails timing,
      NotificationSettings notificationSettings,
      bool isArchived});

  @override
  $EventTimingDetailsCopyWith<$Res> get timing;
  @override
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
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
    Object? title = null,
    Object? notes = freezed,
    Object? iconName = freezed,
    Object? createdAt = null,
    Object? tags = null,
    Object? type = null,
    Object? timing = null,
    Object? notificationSettings = null,
    Object? isArchived = null,
  }) {
    return _then(_$CountdownEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as EventTimingDetails,
      notificationSettings: null == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountdownEventImpl implements _CountdownEvent {
  const _$CountdownEventImpl(
      {required this.id,
      required this.title,
      this.notes,
      this.iconName,
      required this.createdAt,
      final List<String> tags = const [],
      required this.type,
      required this.timing,
      required this.notificationSettings,
      this.isArchived = false})
      : _tags = tags;

  factory _$CountdownEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountdownEventImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? notes;
  @override
  final String? iconName;
  @override
  final DateTime createdAt;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final EventType type;
  @override
  final EventTimingDetails timing;
  @override
  final NotificationSettings notificationSettings;
  @override
  @JsonKey()
  final bool isArchived;

  @override
  String toString() {
    return 'CountdownEvent(id: $id, title: $title, notes: $notes, iconName: $iconName, createdAt: $createdAt, tags: $tags, type: $type, timing: $timing, notificationSettings: $notificationSettings, isArchived: $isArchived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountdownEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timing, timing) || other.timing == timing) &&
            (identical(other.notificationSettings, notificationSettings) ||
                other.notificationSettings == notificationSettings) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      notes,
      iconName,
      createdAt,
      const DeepCollectionEquality().hash(_tags),
      type,
      timing,
      notificationSettings,
      isArchived);

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountdownEventImplCopyWith<_$CountdownEventImpl> get copyWith =>
      __$$CountdownEventImplCopyWithImpl<_$CountdownEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountdownEventImplToJson(
      this,
    );
  }
}

abstract class _CountdownEvent implements CountdownEvent {
  const factory _CountdownEvent(
      {required final String id,
      required final String title,
      final String? notes,
      final String? iconName,
      required final DateTime createdAt,
      final List<String> tags,
      required final EventType type,
      required final EventTimingDetails timing,
      required final NotificationSettings notificationSettings,
      final bool isArchived}) = _$CountdownEventImpl;

  factory _CountdownEvent.fromJson(Map<String, dynamic> json) =
      _$CountdownEventImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get notes;
  @override
  String? get iconName;
  @override
  DateTime get createdAt;
  @override
  List<String> get tags;
  @override
  EventType get type;
  @override
  EventTimingDetails get timing;
  @override
  NotificationSettings get notificationSettings;
  @override
  bool get isArchived;

  /// Create a copy of CountdownEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountdownEventImplCopyWith<_$CountdownEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
