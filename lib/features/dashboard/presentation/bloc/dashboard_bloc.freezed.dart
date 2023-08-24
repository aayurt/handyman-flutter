// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'DashboardEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DashboardEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardInitialState value) initial,
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardLoadedState value) loaded,
    required TResult Function(DashboardErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitialState value)? initial,
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardLoadedState value)? loaded,
    TResult? Function(DashboardErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitialState value)? initial,
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardLoadedState value)? loaded,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DashboardInitialStateCopyWith<$Res> {
  factory _$$DashboardInitialStateCopyWith(_$DashboardInitialState value,
          $Res Function(_$DashboardInitialState) then) =
      __$$DashboardInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardInitialStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardInitialState>
    implements _$$DashboardInitialStateCopyWith<$Res> {
  __$$DashboardInitialStateCopyWithImpl(_$DashboardInitialState _value,
      $Res Function(_$DashboardInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardInitialState implements DashboardInitialState {
  const _$DashboardInitialState();

  @override
  String toString() {
    return 'DashboardState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(DashboardInitialState value) initial,
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardLoadedState value) loaded,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitialState value)? initial,
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardLoadedState value)? loaded,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitialState value)? initial,
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardLoadedState value)? loaded,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DashboardInitialState implements DashboardState {
  const factory DashboardInitialState() = _$DashboardInitialState;
}

/// @nodoc
abstract class _$$DashboardLoadingStateCopyWith<$Res> {
  factory _$$DashboardLoadingStateCopyWith(_$DashboardLoadingState value,
          $Res Function(_$DashboardLoadingState) then) =
      __$$DashboardLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardLoadingStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardLoadingState>
    implements _$$DashboardLoadingStateCopyWith<$Res> {
  __$$DashboardLoadingStateCopyWithImpl(_$DashboardLoadingState _value,
      $Res Function(_$DashboardLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardLoadingState implements DashboardLoadingState {
  const _$DashboardLoadingState();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(DashboardInitialState value) initial,
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardLoadedState value) loaded,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitialState value)? initial,
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardLoadedState value)? loaded,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitialState value)? initial,
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardLoadedState value)? loaded,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DashboardLoadingState implements DashboardState {
  const factory DashboardLoadingState() = _$DashboardLoadingState;
}

/// @nodoc
abstract class _$$DashboardLoadedStateCopyWith<$Res> {
  factory _$$DashboardLoadedStateCopyWith(_$DashboardLoadedState value,
          $Res Function(_$DashboardLoadedState) then) =
      __$$DashboardLoadedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardLoadedStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardLoadedState>
    implements _$$DashboardLoadedStateCopyWith<$Res> {
  __$$DashboardLoadedStateCopyWithImpl(_$DashboardLoadedState _value,
      $Res Function(_$DashboardLoadedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardLoadedState implements DashboardLoadedState {
  const _$DashboardLoadedState();

  @override
  String toString() {
    return 'DashboardState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardInitialState value) initial,
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardLoadedState value) loaded,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitialState value)? initial,
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardLoadedState value)? loaded,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitialState value)? initial,
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardLoadedState value)? loaded,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DashboardLoadedState implements DashboardState {
  const factory DashboardLoadedState() = _$DashboardLoadedState;
}

/// @nodoc
abstract class _$$DashboardErrorStateCopyWith<$Res> {
  factory _$$DashboardErrorStateCopyWith(_$DashboardErrorState value,
          $Res Function(_$DashboardErrorState) then) =
      __$$DashboardErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardErrorStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardErrorState>
    implements _$$DashboardErrorStateCopyWith<$Res> {
  __$$DashboardErrorStateCopyWithImpl(
      _$DashboardErrorState _value, $Res Function(_$DashboardErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardErrorState implements DashboardErrorState {
  const _$DashboardErrorState();

  @override
  String toString() {
    return 'DashboardState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(DashboardInitialState value) initial,
    required TResult Function(DashboardLoadingState value) loading,
    required TResult Function(DashboardLoadedState value) loaded,
    required TResult Function(DashboardErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitialState value)? initial,
    TResult? Function(DashboardLoadingState value)? loading,
    TResult? Function(DashboardLoadedState value)? loaded,
    TResult? Function(DashboardErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitialState value)? initial,
    TResult Function(DashboardLoadingState value)? loading,
    TResult Function(DashboardLoadedState value)? loaded,
    TResult Function(DashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DashboardErrorState implements DashboardState {
  const factory DashboardErrorState() = _$DashboardErrorState;
}
