// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_job_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleJobEvent {
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
    required TResult Function(_SingleJobEventGet value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleJobEventGet value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleJobEventGet value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleJobEventCopyWith<SingleJobEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleJobEventCopyWith<$Res> {
  factory $SingleJobEventCopyWith(
          SingleJobEvent value, $Res Function(SingleJobEvent) then) =
      _$SingleJobEventCopyWithImpl<$Res, SingleJobEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$SingleJobEventCopyWithImpl<$Res, $Val extends SingleJobEvent>
    implements $SingleJobEventCopyWith<$Res> {
  _$SingleJobEventCopyWithImpl(this._value, this._then);

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
abstract class _$$_SingleJobEventGetCopyWith<$Res>
    implements $SingleJobEventCopyWith<$Res> {
  factory _$$_SingleJobEventGetCopyWith(_$_SingleJobEventGet value,
          $Res Function(_$_SingleJobEventGet) then) =
      __$$_SingleJobEventGetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_SingleJobEventGetCopyWithImpl<$Res>
    extends _$SingleJobEventCopyWithImpl<$Res, _$_SingleJobEventGet>
    implements _$$_SingleJobEventGetCopyWith<$Res> {
  __$$_SingleJobEventGetCopyWithImpl(
      _$_SingleJobEventGet _value, $Res Function(_$_SingleJobEventGet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_SingleJobEventGet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SingleJobEventGet implements _SingleJobEventGet {
  const _$_SingleJobEventGet({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'SingleJobEvent.get(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleJobEventGet &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleJobEventGetCopyWith<_$_SingleJobEventGet> get copyWith =>
      __$$_SingleJobEventGetCopyWithImpl<_$_SingleJobEventGet>(
          this, _$identity);

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
    required TResult Function(_SingleJobEventGet value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleJobEventGet value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleJobEventGet value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _SingleJobEventGet implements SingleJobEvent {
  const factory _SingleJobEventGet({required final String id}) =
      _$_SingleJobEventGet;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_SingleJobEventGetCopyWith<_$_SingleJobEventGet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SingleJobState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel job) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel job)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel job)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleJobStateInitial value) initial,
    required TResult Function(SingleJobStateLoading value) loading,
    required TResult Function(SingleJobStateLoaded value) loaded,
    required TResult Function(SingleJobStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleJobStateInitial value)? initial,
    TResult? Function(SingleJobStateLoading value)? loading,
    TResult? Function(SingleJobStateLoaded value)? loaded,
    TResult? Function(SingleJobStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleJobStateInitial value)? initial,
    TResult Function(SingleJobStateLoading value)? loading,
    TResult Function(SingleJobStateLoaded value)? loaded,
    TResult Function(SingleJobStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleJobStateCopyWith<$Res> {
  factory $SingleJobStateCopyWith(
          SingleJobState value, $Res Function(SingleJobState) then) =
      _$SingleJobStateCopyWithImpl<$Res, SingleJobState>;
}

/// @nodoc
class _$SingleJobStateCopyWithImpl<$Res, $Val extends SingleJobState>
    implements $SingleJobStateCopyWith<$Res> {
  _$SingleJobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SingleJobStateInitialCopyWith<$Res> {
  factory _$$SingleJobStateInitialCopyWith(_$SingleJobStateInitial value,
          $Res Function(_$SingleJobStateInitial) then) =
      __$$SingleJobStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleJobStateInitialCopyWithImpl<$Res>
    extends _$SingleJobStateCopyWithImpl<$Res, _$SingleJobStateInitial>
    implements _$$SingleJobStateInitialCopyWith<$Res> {
  __$$SingleJobStateInitialCopyWithImpl(_$SingleJobStateInitial _value,
      $Res Function(_$SingleJobStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleJobStateInitial implements SingleJobStateInitial {
  const _$SingleJobStateInitial();

  @override
  String toString() {
    return 'SingleJobState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SingleJobStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel job) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel job)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel job)? loaded,
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
    required TResult Function(SingleJobStateInitial value) initial,
    required TResult Function(SingleJobStateLoading value) loading,
    required TResult Function(SingleJobStateLoaded value) loaded,
    required TResult Function(SingleJobStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleJobStateInitial value)? initial,
    TResult? Function(SingleJobStateLoading value)? loading,
    TResult? Function(SingleJobStateLoaded value)? loaded,
    TResult? Function(SingleJobStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleJobStateInitial value)? initial,
    TResult Function(SingleJobStateLoading value)? loading,
    TResult Function(SingleJobStateLoaded value)? loaded,
    TResult Function(SingleJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SingleJobStateInitial implements SingleJobState {
  const factory SingleJobStateInitial() = _$SingleJobStateInitial;
}

/// @nodoc
abstract class _$$SingleJobStateLoadingCopyWith<$Res> {
  factory _$$SingleJobStateLoadingCopyWith(_$SingleJobStateLoading value,
          $Res Function(_$SingleJobStateLoading) then) =
      __$$SingleJobStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleJobStateLoadingCopyWithImpl<$Res>
    extends _$SingleJobStateCopyWithImpl<$Res, _$SingleJobStateLoading>
    implements _$$SingleJobStateLoadingCopyWith<$Res> {
  __$$SingleJobStateLoadingCopyWithImpl(_$SingleJobStateLoading _value,
      $Res Function(_$SingleJobStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleJobStateLoading implements SingleJobStateLoading {
  const _$SingleJobStateLoading();

  @override
  String toString() {
    return 'SingleJobState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SingleJobStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel job) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel job)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel job)? loaded,
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
    required TResult Function(SingleJobStateInitial value) initial,
    required TResult Function(SingleJobStateLoading value) loading,
    required TResult Function(SingleJobStateLoaded value) loaded,
    required TResult Function(SingleJobStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleJobStateInitial value)? initial,
    TResult? Function(SingleJobStateLoading value)? loading,
    TResult? Function(SingleJobStateLoaded value)? loaded,
    TResult? Function(SingleJobStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleJobStateInitial value)? initial,
    TResult Function(SingleJobStateLoading value)? loading,
    TResult Function(SingleJobStateLoaded value)? loaded,
    TResult Function(SingleJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SingleJobStateLoading implements SingleJobState {
  const factory SingleJobStateLoading() = _$SingleJobStateLoading;
}

/// @nodoc
abstract class _$$SingleJobStateLoadedCopyWith<$Res> {
  factory _$$SingleJobStateLoadedCopyWith(_$SingleJobStateLoaded value,
          $Res Function(_$SingleJobStateLoaded) then) =
      __$$SingleJobStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({JobModel job});

  $JobModelCopyWith<$Res> get job;
}

/// @nodoc
class __$$SingleJobStateLoadedCopyWithImpl<$Res>
    extends _$SingleJobStateCopyWithImpl<$Res, _$SingleJobStateLoaded>
    implements _$$SingleJobStateLoadedCopyWith<$Res> {
  __$$SingleJobStateLoadedCopyWithImpl(_$SingleJobStateLoaded _value,
      $Res Function(_$SingleJobStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = null,
  }) {
    return _then(_$SingleJobStateLoaded(
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as JobModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $JobModelCopyWith<$Res> get job {
    return $JobModelCopyWith<$Res>(_value.job, (value) {
      return _then(_value.copyWith(job: value));
    });
  }
}

/// @nodoc

class _$SingleJobStateLoaded implements SingleJobStateLoaded {
  const _$SingleJobStateLoaded({required this.job});

  @override
  final JobModel job;

  @override
  String toString() {
    return 'SingleJobState.loaded(job: $job)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleJobStateLoaded &&
            (identical(other.job, job) || other.job == job));
  }

  @override
  int get hashCode => Object.hash(runtimeType, job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleJobStateLoadedCopyWith<_$SingleJobStateLoaded> get copyWith =>
      __$$SingleJobStateLoadedCopyWithImpl<_$SingleJobStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel job) loaded,
    required TResult Function() error,
  }) {
    return loaded(job);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel job)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(job);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel job)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(job);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleJobStateInitial value) initial,
    required TResult Function(SingleJobStateLoading value) loading,
    required TResult Function(SingleJobStateLoaded value) loaded,
    required TResult Function(SingleJobStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleJobStateInitial value)? initial,
    TResult? Function(SingleJobStateLoading value)? loading,
    TResult? Function(SingleJobStateLoaded value)? loaded,
    TResult? Function(SingleJobStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleJobStateInitial value)? initial,
    TResult Function(SingleJobStateLoading value)? loading,
    TResult Function(SingleJobStateLoaded value)? loaded,
    TResult Function(SingleJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SingleJobStateLoaded implements SingleJobState {
  const factory SingleJobStateLoaded({required final JobModel job}) =
      _$SingleJobStateLoaded;

  JobModel get job;
  @JsonKey(ignore: true)
  _$$SingleJobStateLoadedCopyWith<_$SingleJobStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingleJobStateErrorCopyWith<$Res> {
  factory _$$SingleJobStateErrorCopyWith(_$SingleJobStateError value,
          $Res Function(_$SingleJobStateError) then) =
      __$$SingleJobStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleJobStateErrorCopyWithImpl<$Res>
    extends _$SingleJobStateCopyWithImpl<$Res, _$SingleJobStateError>
    implements _$$SingleJobStateErrorCopyWith<$Res> {
  __$$SingleJobStateErrorCopyWithImpl(
      _$SingleJobStateError _value, $Res Function(_$SingleJobStateError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleJobStateError implements SingleJobStateError {
  const _$SingleJobStateError();

  @override
  String toString() {
    return 'SingleJobState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SingleJobStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobModel job) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobModel job)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobModel job)? loaded,
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
    required TResult Function(SingleJobStateInitial value) initial,
    required TResult Function(SingleJobStateLoading value) loading,
    required TResult Function(SingleJobStateLoaded value) loaded,
    required TResult Function(SingleJobStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleJobStateInitial value)? initial,
    TResult? Function(SingleJobStateLoading value)? loading,
    TResult? Function(SingleJobStateLoaded value)? loaded,
    TResult? Function(SingleJobStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleJobStateInitial value)? initial,
    TResult Function(SingleJobStateLoading value)? loading,
    TResult Function(SingleJobStateLoaded value)? loaded,
    TResult Function(SingleJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SingleJobStateError implements SingleJobState {
  const factory SingleJobStateError() = _$SingleJobStateError;
}
