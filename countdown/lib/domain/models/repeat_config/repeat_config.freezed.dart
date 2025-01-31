// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeat_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepeatConfiguration {
  RepeatType get type => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;

  /// Create a copy of RepeatConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepeatConfigurationCopyWith<RepeatConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatConfigurationCopyWith<$Res> {
  factory $RepeatConfigurationCopyWith(
          RepeatConfiguration value, $Res Function(RepeatConfiguration) then) =
      _$RepeatConfigurationCopyWithImpl<$Res, RepeatConfiguration>;
  @useResult
  $Res call({RepeatType type, int interval});
}

/// @nodoc
class _$RepeatConfigurationCopyWithImpl<$Res, $Val extends RepeatConfiguration>
    implements $RepeatConfigurationCopyWith<$Res> {
  _$RepeatConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepeatConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interval = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepeatConfigurationImplCopyWith<$Res>
    implements $RepeatConfigurationCopyWith<$Res> {
  factory _$$RepeatConfigurationImplCopyWith(_$RepeatConfigurationImpl value,
          $Res Function(_$RepeatConfigurationImpl) then) =
      __$$RepeatConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RepeatType type, int interval});
}

/// @nodoc
class __$$RepeatConfigurationImplCopyWithImpl<$Res>
    extends _$RepeatConfigurationCopyWithImpl<$Res, _$RepeatConfigurationImpl>
    implements _$$RepeatConfigurationImplCopyWith<$Res> {
  __$$RepeatConfigurationImplCopyWithImpl(_$RepeatConfigurationImpl _value,
      $Res Function(_$RepeatConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepeatConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interval = null,
  }) {
    return _then(_$RepeatConfigurationImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RepeatConfigurationImpl implements _RepeatConfiguration {
  const _$RepeatConfigurationImpl({required this.type, this.interval = 1});

  @override
  final RepeatType type;
  @override
  @JsonKey()
  final int interval;

  @override
  String toString() {
    return 'RepeatConfiguration(type: $type, interval: $interval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepeatConfigurationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.interval, interval) ||
                other.interval == interval));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, interval);

  /// Create a copy of RepeatConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepeatConfigurationImplCopyWith<_$RepeatConfigurationImpl> get copyWith =>
      __$$RepeatConfigurationImplCopyWithImpl<_$RepeatConfigurationImpl>(
          this, _$identity);
}

abstract class _RepeatConfiguration implements RepeatConfiguration {
  const factory _RepeatConfiguration(
      {required final RepeatType type,
      final int interval}) = _$RepeatConfigurationImpl;

  @override
  RepeatType get type;
  @override
  int get interval;

  /// Create a copy of RepeatConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepeatConfigurationImplCopyWith<_$RepeatConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
