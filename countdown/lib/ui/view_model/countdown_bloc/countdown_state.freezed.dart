// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countdown_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountdownState {
  List<CountdownEvent> get events => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountdownStateCopyWith<CountdownState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountdownStateCopyWith<$Res> {
  factory $CountdownStateCopyWith(
          CountdownState value, $Res Function(CountdownState) then) =
      _$CountdownStateCopyWithImpl<$Res, CountdownState>;
  @useResult
  $Res call({List<CountdownEvent> events, DateTime? lastUpdated});
}

/// @nodoc
class _$CountdownStateCopyWithImpl<$Res, $Val extends CountdownState>
    implements $CountdownStateCopyWith<$Res> {
  _$CountdownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CountdownEvent>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountdownStateImplCopyWith<$Res>
    implements $CountdownStateCopyWith<$Res> {
  factory _$$CountdownStateImplCopyWith(_$CountdownStateImpl value,
          $Res Function(_$CountdownStateImpl) then) =
      __$$CountdownStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CountdownEvent> events, DateTime? lastUpdated});
}

/// @nodoc
class __$$CountdownStateImplCopyWithImpl<$Res>
    extends _$CountdownStateCopyWithImpl<$Res, _$CountdownStateImpl>
    implements _$$CountdownStateImplCopyWith<$Res> {
  __$$CountdownStateImplCopyWithImpl(
      _$CountdownStateImpl _value, $Res Function(_$CountdownStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$CountdownStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CountdownEvent>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CountdownStateImpl implements _CountdownState {
  const _$CountdownStateImpl(
      {final List<CountdownEvent> events = const [], this.lastUpdated})
      : _events = events;

  final List<CountdownEvent> _events;
  @override
  @JsonKey()
  List<CountdownEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'CountdownState(events: $events, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountdownStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_events), lastUpdated);

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountdownStateImplCopyWith<_$CountdownStateImpl> get copyWith =>
      __$$CountdownStateImplCopyWithImpl<_$CountdownStateImpl>(
          this, _$identity);
}

abstract class _CountdownState implements CountdownState {
  const factory _CountdownState(
      {final List<CountdownEvent> events,
      final DateTime? lastUpdated}) = _$CountdownStateImpl;

  @override
  List<CountdownEvent> get events;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountdownStateImplCopyWith<_$CountdownStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
