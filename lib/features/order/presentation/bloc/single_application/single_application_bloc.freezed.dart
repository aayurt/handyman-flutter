// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_application_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleApplicationEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SingleApplicationEventGet value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleApplicationEventGet value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleApplicationEventGet value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleApplicationEventCopyWith<SingleApplicationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleApplicationEventCopyWith<$Res> {
  factory $SingleApplicationEventCopyWith(SingleApplicationEvent value,
          $Res Function(SingleApplicationEvent) then) =
      _$SingleApplicationEventCopyWithImpl<$Res, SingleApplicationEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$SingleApplicationEventCopyWithImpl<$Res,
        $Val extends SingleApplicationEvent>
    implements $SingleApplicationEventCopyWith<$Res> {
  _$SingleApplicationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SingleApplicationEventGetCopyWith<$Res>
    implements $SingleApplicationEventCopyWith<$Res> {
  factory _$$_SingleApplicationEventGetCopyWith(
          _$_SingleApplicationEventGet value,
          $Res Function(_$_SingleApplicationEventGet) then) =
      __$$_SingleApplicationEventGetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_SingleApplicationEventGetCopyWithImpl<$Res>
    extends _$SingleApplicationEventCopyWithImpl<$Res,
        _$_SingleApplicationEventGet>
    implements _$$_SingleApplicationEventGetCopyWith<$Res> {
  __$$_SingleApplicationEventGetCopyWithImpl(
      _$_SingleApplicationEventGet _value,
      $Res Function(_$_SingleApplicationEventGet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_SingleApplicationEventGet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SingleApplicationEventGet implements _SingleApplicationEventGet {
  const _$_SingleApplicationEventGet({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'SingleApplicationEvent.get(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleApplicationEventGet &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleApplicationEventGetCopyWith<_$_SingleApplicationEventGet>
      get copyWith => __$$_SingleApplicationEventGetCopyWithImpl<
          _$_SingleApplicationEventGet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) get,
  }) {
    return get(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? get,
  }) {
    return get?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SingleApplicationEventGet value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleApplicationEventGet value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleApplicationEventGet value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _SingleApplicationEventGet implements SingleApplicationEvent {
  const factory _SingleApplicationEventGet({required final String id}) =
      _$_SingleApplicationEventGet;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_SingleApplicationEventGetCopyWith<_$_SingleApplicationEventGet>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SingleApplicationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApplicationModel application) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApplicationModel application)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApplicationModel application)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleApplicationStateInitial value) initial,
    required TResult Function(SingleApplicationStateLoading value) loading,
    required TResult Function(SingleApplicationStateLoaded value) loaded,
    required TResult Function(SingleApplicationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleApplicationStateInitial value)? initial,
    TResult? Function(SingleApplicationStateLoading value)? loading,
    TResult? Function(SingleApplicationStateLoaded value)? loaded,
    TResult? Function(SingleApplicationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleApplicationStateInitial value)? initial,
    TResult Function(SingleApplicationStateLoading value)? loading,
    TResult Function(SingleApplicationStateLoaded value)? loaded,
    TResult Function(SingleApplicationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleApplicationStateCopyWith<$Res> {
  factory $SingleApplicationStateCopyWith(SingleApplicationState value,
          $Res Function(SingleApplicationState) then) =
      _$SingleApplicationStateCopyWithImpl<$Res, SingleApplicationState>;
}

/// @nodoc
class _$SingleApplicationStateCopyWithImpl<$Res,
        $Val extends SingleApplicationState>
    implements $SingleApplicationStateCopyWith<$Res> {
  _$SingleApplicationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SingleApplicationStateInitialCopyWith<$Res> {
  factory _$$SingleApplicationStateInitialCopyWith(
          _$SingleApplicationStateInitial value,
          $Res Function(_$SingleApplicationStateInitial) then) =
      __$$SingleApplicationStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleApplicationStateInitialCopyWithImpl<$Res>
    extends _$SingleApplicationStateCopyWithImpl<$Res,
        _$SingleApplicationStateInitial>
    implements _$$SingleApplicationStateInitialCopyWith<$Res> {
  __$$SingleApplicationStateInitialCopyWithImpl(
      _$SingleApplicationStateInitial _value,
      $Res Function(_$SingleApplicationStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleApplicationStateInitial implements SingleApplicationStateInitial {
  const _$SingleApplicationStateInitial();

  @override
  String toString() {
    return 'SingleApplicationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleApplicationStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApplicationModel application) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApplicationModel application)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApplicationModel application)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleApplicationStateInitial value) initial,
    required TResult Function(SingleApplicationStateLoading value) loading,
    required TResult Function(SingleApplicationStateLoaded value) loaded,
    required TResult Function(SingleApplicationStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleApplicationStateInitial value)? initial,
    TResult? Function(SingleApplicationStateLoading value)? loading,
    TResult? Function(SingleApplicationStateLoaded value)? loaded,
    TResult? Function(SingleApplicationStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleApplicationStateInitial value)? initial,
    TResult Function(SingleApplicationStateLoading value)? loading,
    TResult Function(SingleApplicationStateLoaded value)? loaded,
    TResult Function(SingleApplicationStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SingleApplicationStateInitial implements SingleApplicationState {
  const factory SingleApplicationStateInitial() =
      _$SingleApplicationStateInitial;
}

/// @nodoc
abstract class _$$SingleApplicationStateLoadingCopyWith<$Res> {
  factory _$$SingleApplicationStateLoadingCopyWith(
          _$SingleApplicationStateLoading value,
          $Res Function(_$SingleApplicationStateLoading) then) =
      __$$SingleApplicationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleApplicationStateLoadingCopyWithImpl<$Res>
    extends _$SingleApplicationStateCopyWithImpl<$Res,
        _$SingleApplicationStateLoading>
    implements _$$SingleApplicationStateLoadingCopyWith<$Res> {
  __$$SingleApplicationStateLoadingCopyWithImpl(
      _$SingleApplicationStateLoading _value,
      $Res Function(_$SingleApplicationStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleApplicationStateLoading implements SingleApplicationStateLoading {
  const _$SingleApplicationStateLoading();

  @override
  String toString() {
    return 'SingleApplicationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleApplicationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApplicationModel application) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApplicationModel application)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApplicationModel application)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleApplicationStateInitial value) initial,
    required TResult Function(SingleApplicationStateLoading value) loading,
    required TResult Function(SingleApplicationStateLoaded value) loaded,
    required TResult Function(SingleApplicationStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleApplicationStateInitial value)? initial,
    TResult? Function(SingleApplicationStateLoading value)? loading,
    TResult? Function(SingleApplicationStateLoaded value)? loaded,
    TResult? Function(SingleApplicationStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleApplicationStateInitial value)? initial,
    TResult Function(SingleApplicationStateLoading value)? loading,
    TResult Function(SingleApplicationStateLoaded value)? loaded,
    TResult Function(SingleApplicationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SingleApplicationStateLoading implements SingleApplicationState {
  const factory SingleApplicationStateLoading() =
      _$SingleApplicationStateLoading;
}

/// @nodoc
abstract class _$$SingleApplicationStateLoadedCopyWith<$Res> {
  factory _$$SingleApplicationStateLoadedCopyWith(
          _$SingleApplicationStateLoaded value,
          $Res Function(_$SingleApplicationStateLoaded) then) =
      __$$SingleApplicationStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({ApplicationModel application});

  $ApplicationModelCopyWith<$Res> get application;
}

/// @nodoc
class __$$SingleApplicationStateLoadedCopyWithImpl<$Res>
    extends _$SingleApplicationStateCopyWithImpl<$Res,
        _$SingleApplicationStateLoaded>
    implements _$$SingleApplicationStateLoadedCopyWith<$Res> {
  __$$SingleApplicationStateLoadedCopyWithImpl(
      _$SingleApplicationStateLoaded _value,
      $Res Function(_$SingleApplicationStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? application = null,
  }) {
    return _then(_$SingleApplicationStateLoaded(
      application: null == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationModelCopyWith<$Res> get application {
    return $ApplicationModelCopyWith<$Res>(_value.application, (value) {
      return _then(_value.copyWith(application: value));
    });
  }
}

/// @nodoc

class _$SingleApplicationStateLoaded implements SingleApplicationStateLoaded {
  const _$SingleApplicationStateLoaded({required this.application});

  @override
  final ApplicationModel application;

  @override
  String toString() {
    return 'SingleApplicationState.loaded(application: $application)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleApplicationStateLoaded &&
            (identical(other.application, application) ||
                other.application == application));
  }

  @override
  int get hashCode => Object.hash(runtimeType, application);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleApplicationStateLoadedCopyWith<_$SingleApplicationStateLoaded>
      get copyWith => __$$SingleApplicationStateLoadedCopyWithImpl<
          _$SingleApplicationStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApplicationModel application) loaded,
    required TResult Function() error,
  }) {
    return loaded(application);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApplicationModel application)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(application);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApplicationModel application)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(application);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleApplicationStateInitial value) initial,
    required TResult Function(SingleApplicationStateLoading value) loading,
    required TResult Function(SingleApplicationStateLoaded value) loaded,
    required TResult Function(SingleApplicationStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleApplicationStateInitial value)? initial,
    TResult? Function(SingleApplicationStateLoading value)? loading,
    TResult? Function(SingleApplicationStateLoaded value)? loaded,
    TResult? Function(SingleApplicationStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleApplicationStateInitial value)? initial,
    TResult Function(SingleApplicationStateLoading value)? loading,
    TResult Function(SingleApplicationStateLoaded value)? loaded,
    TResult Function(SingleApplicationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SingleApplicationStateLoaded implements SingleApplicationState {
  const factory SingleApplicationStateLoaded(
          {required final ApplicationModel application}) =
      _$SingleApplicationStateLoaded;

  ApplicationModel get application;
  @JsonKey(ignore: true)
  _$$SingleApplicationStateLoadedCopyWith<_$SingleApplicationStateLoaded>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingleApplicationStateErrorCopyWith<$Res> {
  factory _$$SingleApplicationStateErrorCopyWith(
          _$SingleApplicationStateError value,
          $Res Function(_$SingleApplicationStateError) then) =
      __$$SingleApplicationStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleApplicationStateErrorCopyWithImpl<$Res>
    extends _$SingleApplicationStateCopyWithImpl<$Res,
        _$SingleApplicationStateError>
    implements _$$SingleApplicationStateErrorCopyWith<$Res> {
  __$$SingleApplicationStateErrorCopyWithImpl(
      _$SingleApplicationStateError _value,
      $Res Function(_$SingleApplicationStateError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleApplicationStateError implements SingleApplicationStateError {
  const _$SingleApplicationStateError();

  @override
  String toString() {
    return 'SingleApplicationState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleApplicationStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApplicationModel application) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApplicationModel application)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApplicationModel application)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleApplicationStateInitial value) initial,
    required TResult Function(SingleApplicationStateLoading value) loading,
    required TResult Function(SingleApplicationStateLoaded value) loaded,
    required TResult Function(SingleApplicationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleApplicationStateInitial value)? initial,
    TResult? Function(SingleApplicationStateLoading value)? loading,
    TResult? Function(SingleApplicationStateLoaded value)? loaded,
    TResult? Function(SingleApplicationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleApplicationStateInitial value)? initial,
    TResult Function(SingleApplicationStateLoading value)? loading,
    TResult Function(SingleApplicationStateLoaded value)? loaded,
    TResult Function(SingleApplicationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SingleApplicationStateError implements SingleApplicationState {
  const factory SingleApplicationStateError() = _$SingleApplicationStateError;
}
