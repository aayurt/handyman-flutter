// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleCategoryEvent {
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
    required TResult Function(_SingleCategoryEventGet value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleCategoryEventGet value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleCategoryEventGet value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleCategoryEventCopyWith<SingleCategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleCategoryEventCopyWith<$Res> {
  factory $SingleCategoryEventCopyWith(
          SingleCategoryEvent value, $Res Function(SingleCategoryEvent) then) =
      _$SingleCategoryEventCopyWithImpl<$Res, SingleCategoryEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$SingleCategoryEventCopyWithImpl<$Res, $Val extends SingleCategoryEvent>
    implements $SingleCategoryEventCopyWith<$Res> {
  _$SingleCategoryEventCopyWithImpl(this._value, this._then);

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
abstract class _$$_SingleCategoryEventGetCopyWith<$Res>
    implements $SingleCategoryEventCopyWith<$Res> {
  factory _$$_SingleCategoryEventGetCopyWith(_$_SingleCategoryEventGet value,
          $Res Function(_$_SingleCategoryEventGet) then) =
      __$$_SingleCategoryEventGetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_SingleCategoryEventGetCopyWithImpl<$Res>
    extends _$SingleCategoryEventCopyWithImpl<$Res, _$_SingleCategoryEventGet>
    implements _$$_SingleCategoryEventGetCopyWith<$Res> {
  __$$_SingleCategoryEventGetCopyWithImpl(_$_SingleCategoryEventGet _value,
      $Res Function(_$_SingleCategoryEventGet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_SingleCategoryEventGet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SingleCategoryEventGet implements _SingleCategoryEventGet {
  const _$_SingleCategoryEventGet({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'SingleCategoryEvent.get(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleCategoryEventGet &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleCategoryEventGetCopyWith<_$_SingleCategoryEventGet> get copyWith =>
      __$$_SingleCategoryEventGetCopyWithImpl<_$_SingleCategoryEventGet>(
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
    required TResult Function(_SingleCategoryEventGet value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleCategoryEventGet value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleCategoryEventGet value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _SingleCategoryEventGet implements SingleCategoryEvent {
  const factory _SingleCategoryEventGet({required final String id}) =
      _$_SingleCategoryEventGet;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_SingleCategoryEventGetCopyWith<_$_SingleCategoryEventGet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SingleCategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<JobModel> jobs) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<JobModel> jobs)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<JobModel> jobs)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleCategoryStateInitial value) initial,
    required TResult Function(SingleCategoryStateLoading value) loading,
    required TResult Function(SingleCategoryStateLoaded value) loaded,
    required TResult Function(SingleCategoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleCategoryStateInitial value)? initial,
    TResult? Function(SingleCategoryStateLoading value)? loading,
    TResult? Function(SingleCategoryStateLoaded value)? loaded,
    TResult? Function(SingleCategoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleCategoryStateInitial value)? initial,
    TResult Function(SingleCategoryStateLoading value)? loading,
    TResult Function(SingleCategoryStateLoaded value)? loaded,
    TResult Function(SingleCategoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleCategoryStateCopyWith<$Res> {
  factory $SingleCategoryStateCopyWith(
          SingleCategoryState value, $Res Function(SingleCategoryState) then) =
      _$SingleCategoryStateCopyWithImpl<$Res, SingleCategoryState>;
}

/// @nodoc
class _$SingleCategoryStateCopyWithImpl<$Res, $Val extends SingleCategoryState>
    implements $SingleCategoryStateCopyWith<$Res> {
  _$SingleCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SingleCategoryStateInitialCopyWith<$Res> {
  factory _$$SingleCategoryStateInitialCopyWith(
          _$SingleCategoryStateInitial value,
          $Res Function(_$SingleCategoryStateInitial) then) =
      __$$SingleCategoryStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleCategoryStateInitialCopyWithImpl<$Res>
    extends _$SingleCategoryStateCopyWithImpl<$Res,
        _$SingleCategoryStateInitial>
    implements _$$SingleCategoryStateInitialCopyWith<$Res> {
  __$$SingleCategoryStateInitialCopyWithImpl(
      _$SingleCategoryStateInitial _value,
      $Res Function(_$SingleCategoryStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleCategoryStateInitial implements SingleCategoryStateInitial {
  const _$SingleCategoryStateInitial();

  @override
  String toString() {
    return 'SingleCategoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleCategoryStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<JobModel> jobs) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<JobModel> jobs)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<JobModel> jobs)? loaded,
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
    required TResult Function(SingleCategoryStateInitial value) initial,
    required TResult Function(SingleCategoryStateLoading value) loading,
    required TResult Function(SingleCategoryStateLoaded value) loaded,
    required TResult Function(SingleCategoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleCategoryStateInitial value)? initial,
    TResult? Function(SingleCategoryStateLoading value)? loading,
    TResult? Function(SingleCategoryStateLoaded value)? loaded,
    TResult? Function(SingleCategoryStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleCategoryStateInitial value)? initial,
    TResult Function(SingleCategoryStateLoading value)? loading,
    TResult Function(SingleCategoryStateLoaded value)? loaded,
    TResult Function(SingleCategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SingleCategoryStateInitial implements SingleCategoryState {
  const factory SingleCategoryStateInitial() = _$SingleCategoryStateInitial;
}

/// @nodoc
abstract class _$$SingleCategoryStateLoadingCopyWith<$Res> {
  factory _$$SingleCategoryStateLoadingCopyWith(
          _$SingleCategoryStateLoading value,
          $Res Function(_$SingleCategoryStateLoading) then) =
      __$$SingleCategoryStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleCategoryStateLoadingCopyWithImpl<$Res>
    extends _$SingleCategoryStateCopyWithImpl<$Res,
        _$SingleCategoryStateLoading>
    implements _$$SingleCategoryStateLoadingCopyWith<$Res> {
  __$$SingleCategoryStateLoadingCopyWithImpl(
      _$SingleCategoryStateLoading _value,
      $Res Function(_$SingleCategoryStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleCategoryStateLoading implements SingleCategoryStateLoading {
  const _$SingleCategoryStateLoading();

  @override
  String toString() {
    return 'SingleCategoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleCategoryStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<JobModel> jobs) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<JobModel> jobs)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<JobModel> jobs)? loaded,
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
    required TResult Function(SingleCategoryStateInitial value) initial,
    required TResult Function(SingleCategoryStateLoading value) loading,
    required TResult Function(SingleCategoryStateLoaded value) loaded,
    required TResult Function(SingleCategoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleCategoryStateInitial value)? initial,
    TResult? Function(SingleCategoryStateLoading value)? loading,
    TResult? Function(SingleCategoryStateLoaded value)? loaded,
    TResult? Function(SingleCategoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleCategoryStateInitial value)? initial,
    TResult Function(SingleCategoryStateLoading value)? loading,
    TResult Function(SingleCategoryStateLoaded value)? loaded,
    TResult Function(SingleCategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SingleCategoryStateLoading implements SingleCategoryState {
  const factory SingleCategoryStateLoading() = _$SingleCategoryStateLoading;
}

/// @nodoc
abstract class _$$SingleCategoryStateLoadedCopyWith<$Res> {
  factory _$$SingleCategoryStateLoadedCopyWith(
          _$SingleCategoryStateLoaded value,
          $Res Function(_$SingleCategoryStateLoaded) then) =
      __$$SingleCategoryStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<JobModel> jobs});
}

/// @nodoc
class __$$SingleCategoryStateLoadedCopyWithImpl<$Res>
    extends _$SingleCategoryStateCopyWithImpl<$Res, _$SingleCategoryStateLoaded>
    implements _$$SingleCategoryStateLoadedCopyWith<$Res> {
  __$$SingleCategoryStateLoadedCopyWithImpl(_$SingleCategoryStateLoaded _value,
      $Res Function(_$SingleCategoryStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_$SingleCategoryStateLoaded(
      jobs: null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobModel>,
    ));
  }
}

/// @nodoc

class _$SingleCategoryStateLoaded implements SingleCategoryStateLoaded {
  const _$SingleCategoryStateLoaded({required final List<JobModel> jobs})
      : _jobs = jobs;

  final List<JobModel> _jobs;
  @override
  List<JobModel> get jobs {
    if (_jobs is EqualUnmodifiableListView) return _jobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobs);
  }

  @override
  String toString() {
    return 'SingleCategoryState.loaded(jobs: $jobs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleCategoryStateLoaded &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_jobs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleCategoryStateLoadedCopyWith<_$SingleCategoryStateLoaded>
      get copyWith => __$$SingleCategoryStateLoadedCopyWithImpl<
          _$SingleCategoryStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<JobModel> jobs) loaded,
    required TResult Function() error,
  }) {
    return loaded(jobs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<JobModel> jobs)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(jobs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<JobModel> jobs)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(jobs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SingleCategoryStateInitial value) initial,
    required TResult Function(SingleCategoryStateLoading value) loading,
    required TResult Function(SingleCategoryStateLoaded value) loaded,
    required TResult Function(SingleCategoryStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleCategoryStateInitial value)? initial,
    TResult? Function(SingleCategoryStateLoading value)? loading,
    TResult? Function(SingleCategoryStateLoaded value)? loaded,
    TResult? Function(SingleCategoryStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleCategoryStateInitial value)? initial,
    TResult Function(SingleCategoryStateLoading value)? loading,
    TResult Function(SingleCategoryStateLoaded value)? loaded,
    TResult Function(SingleCategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SingleCategoryStateLoaded implements SingleCategoryState {
  const factory SingleCategoryStateLoaded(
      {required final List<JobModel> jobs}) = _$SingleCategoryStateLoaded;

  List<JobModel> get jobs;
  @JsonKey(ignore: true)
  _$$SingleCategoryStateLoadedCopyWith<_$SingleCategoryStateLoaded>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingleCategoryStateErrorCopyWith<$Res> {
  factory _$$SingleCategoryStateErrorCopyWith(_$SingleCategoryStateError value,
          $Res Function(_$SingleCategoryStateError) then) =
      __$$SingleCategoryStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingleCategoryStateErrorCopyWithImpl<$Res>
    extends _$SingleCategoryStateCopyWithImpl<$Res, _$SingleCategoryStateError>
    implements _$$SingleCategoryStateErrorCopyWith<$Res> {
  __$$SingleCategoryStateErrorCopyWithImpl(_$SingleCategoryStateError _value,
      $Res Function(_$SingleCategoryStateError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingleCategoryStateError implements SingleCategoryStateError {
  const _$SingleCategoryStateError();

  @override
  String toString() {
    return 'SingleCategoryState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleCategoryStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<JobModel> jobs) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<JobModel> jobs)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<JobModel> jobs)? loaded,
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
    required TResult Function(SingleCategoryStateInitial value) initial,
    required TResult Function(SingleCategoryStateLoading value) loading,
    required TResult Function(SingleCategoryStateLoaded value) loaded,
    required TResult Function(SingleCategoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SingleCategoryStateInitial value)? initial,
    TResult? Function(SingleCategoryStateLoading value)? loading,
    TResult? Function(SingleCategoryStateLoaded value)? loaded,
    TResult? Function(SingleCategoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SingleCategoryStateInitial value)? initial,
    TResult Function(SingleCategoryStateLoading value)? loading,
    TResult Function(SingleCategoryStateLoaded value)? loaded,
    TResult Function(SingleCategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SingleCategoryStateError implements SingleCategoryState {
  const factory SingleCategoryStateError() = _$SingleCategoryStateError;
}
