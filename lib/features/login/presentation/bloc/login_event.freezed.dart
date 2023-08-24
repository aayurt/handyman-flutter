// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  LoginApiRequestModel get param => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginApiRequestModel param) onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginApiRequestModel param)? onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginApiRequestModel param)? onLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLogin value) onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLogin value)? onLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLogin value)? onLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
  @useResult
  $Res call({LoginApiRequestModel param});

  $LoginApiRequestModelCopyWith<$Res> get param;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? param = null,
  }) {
    return _then(_value.copyWith(
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as LoginApiRequestModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginApiRequestModelCopyWith<$Res> get param {
    return $LoginApiRequestModelCopyWith<$Res>(_value.param, (value) {
      return _then(_value.copyWith(param: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnLoginCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$$OnLoginCopyWith(_$OnLogin value, $Res Function(_$OnLogin) then) =
      __$$OnLoginCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginApiRequestModel param});

  @override
  $LoginApiRequestModelCopyWith<$Res> get param;
}

/// @nodoc
class __$$OnLoginCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$OnLogin>
    implements _$$OnLoginCopyWith<$Res> {
  __$$OnLoginCopyWithImpl(_$OnLogin _value, $Res Function(_$OnLogin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? param = null,
  }) {
    return _then(_$OnLogin(
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as LoginApiRequestModel,
    ));
  }
}

/// @nodoc

class _$OnLogin implements OnLogin {
  const _$OnLogin({required this.param});

  @override
  final LoginApiRequestModel param;

  @override
  String toString() {
    return 'LoginEvent.onLogin(param: $param)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLogin &&
            (identical(other.param, param) || other.param == param));
  }

  @override
  int get hashCode => Object.hash(runtimeType, param);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoginCopyWith<_$OnLogin> get copyWith =>
      __$$OnLoginCopyWithImpl<_$OnLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginApiRequestModel param) onLogin,
  }) {
    return onLogin(param);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginApiRequestModel param)? onLogin,
  }) {
    return onLogin?.call(param);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginApiRequestModel param)? onLogin,
    required TResult orElse(),
  }) {
    if (onLogin != null) {
      return onLogin(param);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLogin value) onLogin,
  }) {
    return onLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLogin value)? onLogin,
  }) {
    return onLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLogin value)? onLogin,
    required TResult orElse(),
  }) {
    if (onLogin != null) {
      return onLogin(this);
    }
    return orElse();
  }
}

abstract class OnLogin implements LoginEvent {
  const factory OnLogin({required final LoginApiRequestModel param}) =
      _$OnLogin;

  @override
  LoginApiRequestModel get param;
  @override
  @JsonKey(ignore: true)
  _$$OnLoginCopyWith<_$OnLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
