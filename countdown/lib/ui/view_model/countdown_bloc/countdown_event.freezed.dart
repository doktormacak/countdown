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
mixin _$CountdownBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(CountdownEvent event) eventCreated,
    required TResult Function(CountdownEvent event) eventEdited,
    required TResult Function(CountdownEvent event) eventDeleted,
    required TResult Function() updatedTimers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(CountdownEvent event)? eventCreated,
    TResult? Function(CountdownEvent event)? eventEdited,
    TResult? Function(CountdownEvent event)? eventDeleted,
    TResult? Function()? updatedTimers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(CountdownEvent event)? eventCreated,
    TResult Function(CountdownEvent event)? eventEdited,
    TResult Function(CountdownEvent event)? eventDeleted,
    TResult Function()? updatedTimers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value) $default, {
    required TResult Function(CountdownBlocEventCreated value) eventCreated,
    required TResult Function(CountdownBlocEventEdited value) eventEdited,
    required TResult Function(CountdownBlocEventDeleted value) eventDeleted,
    required TResult Function(UpdatedTimers value) updatedTimers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountdownBlocEvent value)? $default, {
    TResult? Function(CountdownBlocEventCreated value)? eventCreated,
    TResult? Function(CountdownBlocEventEdited value)? eventEdited,
    TResult? Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult? Function(UpdatedTimers value)? updatedTimers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value)? $default, {
    TResult Function(CountdownBlocEventCreated value)? eventCreated,
    TResult Function(CountdownBlocEventEdited value)? eventEdited,
    TResult Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult Function(UpdatedTimers value)? updatedTimers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountdownBlocEventCopyWith<$Res> {
  factory $CountdownBlocEventCopyWith(
          CountdownBlocEvent value, $Res Function(CountdownBlocEvent) then) =
      _$CountdownBlocEventCopyWithImpl<$Res, CountdownBlocEvent>;
}

/// @nodoc
class _$CountdownBlocEventCopyWithImpl<$Res, $Val extends CountdownBlocEvent>
    implements $CountdownBlocEventCopyWith<$Res> {
  _$CountdownBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CountdownBlocEventImplCopyWith<$Res> {
  factory _$$CountdownBlocEventImplCopyWith(_$CountdownBlocEventImpl value,
          $Res Function(_$CountdownBlocEventImpl) then) =
      __$$CountdownBlocEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CountdownBlocEventImplCopyWithImpl<$Res>
    extends _$CountdownBlocEventCopyWithImpl<$Res, _$CountdownBlocEventImpl>
    implements _$$CountdownBlocEventImplCopyWith<$Res> {
  __$$CountdownBlocEventImplCopyWithImpl(_$CountdownBlocEventImpl _value,
      $Res Function(_$CountdownBlocEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CountdownBlocEventImpl
    with DiagnosticableTreeMixin
    implements _CountdownBlocEvent {
  const _$CountdownBlocEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountdownBlocEvent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CountdownBlocEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CountdownBlocEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(CountdownEvent event) eventCreated,
    required TResult Function(CountdownEvent event) eventEdited,
    required TResult Function(CountdownEvent event) eventDeleted,
    required TResult Function() updatedTimers,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(CountdownEvent event)? eventCreated,
    TResult? Function(CountdownEvent event)? eventEdited,
    TResult? Function(CountdownEvent event)? eventDeleted,
    TResult? Function()? updatedTimers,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(CountdownEvent event)? eventCreated,
    TResult Function(CountdownEvent event)? eventEdited,
    TResult Function(CountdownEvent event)? eventDeleted,
    TResult Function()? updatedTimers,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value) $default, {
    required TResult Function(CountdownBlocEventCreated value) eventCreated,
    required TResult Function(CountdownBlocEventEdited value) eventEdited,
    required TResult Function(CountdownBlocEventDeleted value) eventDeleted,
    required TResult Function(UpdatedTimers value) updatedTimers,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountdownBlocEvent value)? $default, {
    TResult? Function(CountdownBlocEventCreated value)? eventCreated,
    TResult? Function(CountdownBlocEventEdited value)? eventEdited,
    TResult? Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult? Function(UpdatedTimers value)? updatedTimers,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value)? $default, {
    TResult Function(CountdownBlocEventCreated value)? eventCreated,
    TResult Function(CountdownBlocEventEdited value)? eventEdited,
    TResult Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult Function(UpdatedTimers value)? updatedTimers,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CountdownBlocEvent implements CountdownBlocEvent {
  const factory _CountdownBlocEvent() = _$CountdownBlocEventImpl;
}

/// @nodoc
abstract class _$$CountdownBlocEventCreatedImplCopyWith<$Res> {
  factory _$$CountdownBlocEventCreatedImplCopyWith(
          _$CountdownBlocEventCreatedImpl value,
          $Res Function(_$CountdownBlocEventCreatedImpl) then) =
      __$$CountdownBlocEventCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CountdownEvent event});

  $CountdownEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$CountdownBlocEventCreatedImplCopyWithImpl<$Res>
    extends _$CountdownBlocEventCopyWithImpl<$Res,
        _$CountdownBlocEventCreatedImpl>
    implements _$$CountdownBlocEventCreatedImplCopyWith<$Res> {
  __$$CountdownBlocEventCreatedImplCopyWithImpl(
      _$CountdownBlocEventCreatedImpl _value,
      $Res Function(_$CountdownBlocEventCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$CountdownBlocEventCreatedImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CountdownEvent,
    ));
  }

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountdownEventCopyWith<$Res> get event {
    return $CountdownEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$CountdownBlocEventCreatedImpl
    with DiagnosticableTreeMixin
    implements CountdownBlocEventCreated {
  const _$CountdownBlocEventCreatedImpl({required this.event});

  @override
  final CountdownEvent event;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountdownBlocEvent.eventCreated(event: $event)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountdownBlocEvent.eventCreated'))
      ..add(DiagnosticsProperty('event', event));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountdownBlocEventCreatedImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountdownBlocEventCreatedImplCopyWith<_$CountdownBlocEventCreatedImpl>
      get copyWith => __$$CountdownBlocEventCreatedImplCopyWithImpl<
          _$CountdownBlocEventCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(CountdownEvent event) eventCreated,
    required TResult Function(CountdownEvent event) eventEdited,
    required TResult Function(CountdownEvent event) eventDeleted,
    required TResult Function() updatedTimers,
  }) {
    return eventCreated(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(CountdownEvent event)? eventCreated,
    TResult? Function(CountdownEvent event)? eventEdited,
    TResult? Function(CountdownEvent event)? eventDeleted,
    TResult? Function()? updatedTimers,
  }) {
    return eventCreated?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(CountdownEvent event)? eventCreated,
    TResult Function(CountdownEvent event)? eventEdited,
    TResult Function(CountdownEvent event)? eventDeleted,
    TResult Function()? updatedTimers,
    required TResult orElse(),
  }) {
    if (eventCreated != null) {
      return eventCreated(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value) $default, {
    required TResult Function(CountdownBlocEventCreated value) eventCreated,
    required TResult Function(CountdownBlocEventEdited value) eventEdited,
    required TResult Function(CountdownBlocEventDeleted value) eventDeleted,
    required TResult Function(UpdatedTimers value) updatedTimers,
  }) {
    return eventCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountdownBlocEvent value)? $default, {
    TResult? Function(CountdownBlocEventCreated value)? eventCreated,
    TResult? Function(CountdownBlocEventEdited value)? eventEdited,
    TResult? Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult? Function(UpdatedTimers value)? updatedTimers,
  }) {
    return eventCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value)? $default, {
    TResult Function(CountdownBlocEventCreated value)? eventCreated,
    TResult Function(CountdownBlocEventEdited value)? eventEdited,
    TResult Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult Function(UpdatedTimers value)? updatedTimers,
    required TResult orElse(),
  }) {
    if (eventCreated != null) {
      return eventCreated(this);
    }
    return orElse();
  }
}

abstract class CountdownBlocEventCreated implements CountdownBlocEvent {
  const factory CountdownBlocEventCreated(
      {required final CountdownEvent event}) = _$CountdownBlocEventCreatedImpl;

  CountdownEvent get event;

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountdownBlocEventCreatedImplCopyWith<_$CountdownBlocEventCreatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CountdownBlocEventEditedImplCopyWith<$Res> {
  factory _$$CountdownBlocEventEditedImplCopyWith(
          _$CountdownBlocEventEditedImpl value,
          $Res Function(_$CountdownBlocEventEditedImpl) then) =
      __$$CountdownBlocEventEditedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CountdownEvent event});

  $CountdownEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$CountdownBlocEventEditedImplCopyWithImpl<$Res>
    extends _$CountdownBlocEventCopyWithImpl<$Res,
        _$CountdownBlocEventEditedImpl>
    implements _$$CountdownBlocEventEditedImplCopyWith<$Res> {
  __$$CountdownBlocEventEditedImplCopyWithImpl(
      _$CountdownBlocEventEditedImpl _value,
      $Res Function(_$CountdownBlocEventEditedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$CountdownBlocEventEditedImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CountdownEvent,
    ));
  }

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountdownEventCopyWith<$Res> get event {
    return $CountdownEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$CountdownBlocEventEditedImpl
    with DiagnosticableTreeMixin
    implements CountdownBlocEventEdited {
  const _$CountdownBlocEventEditedImpl({required this.event});

  @override
  final CountdownEvent event;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountdownBlocEvent.eventEdited(event: $event)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountdownBlocEvent.eventEdited'))
      ..add(DiagnosticsProperty('event', event));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountdownBlocEventEditedImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountdownBlocEventEditedImplCopyWith<_$CountdownBlocEventEditedImpl>
      get copyWith => __$$CountdownBlocEventEditedImplCopyWithImpl<
          _$CountdownBlocEventEditedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(CountdownEvent event) eventCreated,
    required TResult Function(CountdownEvent event) eventEdited,
    required TResult Function(CountdownEvent event) eventDeleted,
    required TResult Function() updatedTimers,
  }) {
    return eventEdited(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(CountdownEvent event)? eventCreated,
    TResult? Function(CountdownEvent event)? eventEdited,
    TResult? Function(CountdownEvent event)? eventDeleted,
    TResult? Function()? updatedTimers,
  }) {
    return eventEdited?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(CountdownEvent event)? eventCreated,
    TResult Function(CountdownEvent event)? eventEdited,
    TResult Function(CountdownEvent event)? eventDeleted,
    TResult Function()? updatedTimers,
    required TResult orElse(),
  }) {
    if (eventEdited != null) {
      return eventEdited(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value) $default, {
    required TResult Function(CountdownBlocEventCreated value) eventCreated,
    required TResult Function(CountdownBlocEventEdited value) eventEdited,
    required TResult Function(CountdownBlocEventDeleted value) eventDeleted,
    required TResult Function(UpdatedTimers value) updatedTimers,
  }) {
    return eventEdited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountdownBlocEvent value)? $default, {
    TResult? Function(CountdownBlocEventCreated value)? eventCreated,
    TResult? Function(CountdownBlocEventEdited value)? eventEdited,
    TResult? Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult? Function(UpdatedTimers value)? updatedTimers,
  }) {
    return eventEdited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value)? $default, {
    TResult Function(CountdownBlocEventCreated value)? eventCreated,
    TResult Function(CountdownBlocEventEdited value)? eventEdited,
    TResult Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult Function(UpdatedTimers value)? updatedTimers,
    required TResult orElse(),
  }) {
    if (eventEdited != null) {
      return eventEdited(this);
    }
    return orElse();
  }
}

abstract class CountdownBlocEventEdited implements CountdownBlocEvent {
  const factory CountdownBlocEventEdited(
      {required final CountdownEvent event}) = _$CountdownBlocEventEditedImpl;

  CountdownEvent get event;

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountdownBlocEventEditedImplCopyWith<_$CountdownBlocEventEditedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CountdownBlocEventDeletedImplCopyWith<$Res> {
  factory _$$CountdownBlocEventDeletedImplCopyWith(
          _$CountdownBlocEventDeletedImpl value,
          $Res Function(_$CountdownBlocEventDeletedImpl) then) =
      __$$CountdownBlocEventDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CountdownEvent event});

  $CountdownEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$CountdownBlocEventDeletedImplCopyWithImpl<$Res>
    extends _$CountdownBlocEventCopyWithImpl<$Res,
        _$CountdownBlocEventDeletedImpl>
    implements _$$CountdownBlocEventDeletedImplCopyWith<$Res> {
  __$$CountdownBlocEventDeletedImplCopyWithImpl(
      _$CountdownBlocEventDeletedImpl _value,
      $Res Function(_$CountdownBlocEventDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$CountdownBlocEventDeletedImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CountdownEvent,
    ));
  }

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountdownEventCopyWith<$Res> get event {
    return $CountdownEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$CountdownBlocEventDeletedImpl
    with DiagnosticableTreeMixin
    implements CountdownBlocEventDeleted {
  const _$CountdownBlocEventDeletedImpl({required this.event});

  @override
  final CountdownEvent event;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountdownBlocEvent.eventDeleted(event: $event)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountdownBlocEvent.eventDeleted'))
      ..add(DiagnosticsProperty('event', event));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountdownBlocEventDeletedImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountdownBlocEventDeletedImplCopyWith<_$CountdownBlocEventDeletedImpl>
      get copyWith => __$$CountdownBlocEventDeletedImplCopyWithImpl<
          _$CountdownBlocEventDeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(CountdownEvent event) eventCreated,
    required TResult Function(CountdownEvent event) eventEdited,
    required TResult Function(CountdownEvent event) eventDeleted,
    required TResult Function() updatedTimers,
  }) {
    return eventDeleted(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(CountdownEvent event)? eventCreated,
    TResult? Function(CountdownEvent event)? eventEdited,
    TResult? Function(CountdownEvent event)? eventDeleted,
    TResult? Function()? updatedTimers,
  }) {
    return eventDeleted?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(CountdownEvent event)? eventCreated,
    TResult Function(CountdownEvent event)? eventEdited,
    TResult Function(CountdownEvent event)? eventDeleted,
    TResult Function()? updatedTimers,
    required TResult orElse(),
  }) {
    if (eventDeleted != null) {
      return eventDeleted(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value) $default, {
    required TResult Function(CountdownBlocEventCreated value) eventCreated,
    required TResult Function(CountdownBlocEventEdited value) eventEdited,
    required TResult Function(CountdownBlocEventDeleted value) eventDeleted,
    required TResult Function(UpdatedTimers value) updatedTimers,
  }) {
    return eventDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountdownBlocEvent value)? $default, {
    TResult? Function(CountdownBlocEventCreated value)? eventCreated,
    TResult? Function(CountdownBlocEventEdited value)? eventEdited,
    TResult? Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult? Function(UpdatedTimers value)? updatedTimers,
  }) {
    return eventDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value)? $default, {
    TResult Function(CountdownBlocEventCreated value)? eventCreated,
    TResult Function(CountdownBlocEventEdited value)? eventEdited,
    TResult Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult Function(UpdatedTimers value)? updatedTimers,
    required TResult orElse(),
  }) {
    if (eventDeleted != null) {
      return eventDeleted(this);
    }
    return orElse();
  }
}

abstract class CountdownBlocEventDeleted implements CountdownBlocEvent {
  const factory CountdownBlocEventDeleted(
      {required final CountdownEvent event}) = _$CountdownBlocEventDeletedImpl;

  CountdownEvent get event;

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountdownBlocEventDeletedImplCopyWith<_$CountdownBlocEventDeletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedTimersImplCopyWith<$Res> {
  factory _$$UpdatedTimersImplCopyWith(
          _$UpdatedTimersImpl value, $Res Function(_$UpdatedTimersImpl) then) =
      __$$UpdatedTimersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatedTimersImplCopyWithImpl<$Res>
    extends _$CountdownBlocEventCopyWithImpl<$Res, _$UpdatedTimersImpl>
    implements _$$UpdatedTimersImplCopyWith<$Res> {
  __$$UpdatedTimersImplCopyWithImpl(
      _$UpdatedTimersImpl _value, $Res Function(_$UpdatedTimersImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountdownBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatedTimersImpl
    with DiagnosticableTreeMixin
    implements UpdatedTimers {
  const _$UpdatedTimersImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountdownBlocEvent.updatedTimers()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountdownBlocEvent.updatedTimers'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdatedTimersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(CountdownEvent event) eventCreated,
    required TResult Function(CountdownEvent event) eventEdited,
    required TResult Function(CountdownEvent event) eventDeleted,
    required TResult Function() updatedTimers,
  }) {
    return updatedTimers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(CountdownEvent event)? eventCreated,
    TResult? Function(CountdownEvent event)? eventEdited,
    TResult? Function(CountdownEvent event)? eventDeleted,
    TResult? Function()? updatedTimers,
  }) {
    return updatedTimers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(CountdownEvent event)? eventCreated,
    TResult Function(CountdownEvent event)? eventEdited,
    TResult Function(CountdownEvent event)? eventDeleted,
    TResult Function()? updatedTimers,
    required TResult orElse(),
  }) {
    if (updatedTimers != null) {
      return updatedTimers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value) $default, {
    required TResult Function(CountdownBlocEventCreated value) eventCreated,
    required TResult Function(CountdownBlocEventEdited value) eventEdited,
    required TResult Function(CountdownBlocEventDeleted value) eventDeleted,
    required TResult Function(UpdatedTimers value) updatedTimers,
  }) {
    return updatedTimers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountdownBlocEvent value)? $default, {
    TResult? Function(CountdownBlocEventCreated value)? eventCreated,
    TResult? Function(CountdownBlocEventEdited value)? eventEdited,
    TResult? Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult? Function(UpdatedTimers value)? updatedTimers,
  }) {
    return updatedTimers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountdownBlocEvent value)? $default, {
    TResult Function(CountdownBlocEventCreated value)? eventCreated,
    TResult Function(CountdownBlocEventEdited value)? eventEdited,
    TResult Function(CountdownBlocEventDeleted value)? eventDeleted,
    TResult Function(UpdatedTimers value)? updatedTimers,
    required TResult orElse(),
  }) {
    if (updatedTimers != null) {
      return updatedTimers(this);
    }
    return orElse();
  }
}

abstract class UpdatedTimers implements CountdownBlocEvent {
  const factory UpdatedTimers() = _$UpdatedTimersImpl;
}
