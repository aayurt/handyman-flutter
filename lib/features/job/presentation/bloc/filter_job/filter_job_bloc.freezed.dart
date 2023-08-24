// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_job_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterJobEvent {
  String get search => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterJobEventGet value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterJobEventGet value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterJobEventGet value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterJobEventCopyWith<FilterJobEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterJobEventCopyWith<$Res> {
  factory $FilterJobEventCopyWith(
          FilterJobEvent value, $Res Function(FilterJobEvent) then) =
      _$FilterJobEventCopyWithImpl<$Res, FilterJobEvent>;
  @useResult
  $Res call({String search});
}

/// @nodoc
class _$FilterJobEventCopyWithImpl<$Res, $Val extends FilterJobEvent>
    implements $FilterJobEventCopyWith<$Res> {
  _$FilterJobEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_value.copyWith(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterJobEventGetCopyWith<$Res>
    implements $FilterJobEventCopyWith<$Res> {
  factory _$$_FilterJobEventGetCopyWith(_$_FilterJobEventGet value,
          $Res Function(_$_FilterJobEventGet) then) =
      __$$_FilterJobEventGetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String search});
}

/// @nodoc
class __$$_FilterJobEventGetCopyWithImpl<$Res>
    extends _$FilterJobEventCopyWithImpl<$Res, _$_FilterJobEventGet>
    implements _$$_FilterJobEventGetCopyWith<$Res> {
  __$$_FilterJobEventGetCopyWithImpl(
      _$_FilterJobEventGet _value, $Res Function(_$_FilterJobEventGet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_$_FilterJobEventGet(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FilterJobEventGet implements _FilterJobEventGet {
  const _$_FilterJobEventGet({required this.search});

  @override
  final String search;

  @override
  String toString() {
    return 'FilterJobEvent.get(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterJobEventGet &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterJobEventGetCopyWith<_$_FilterJobEventGet> get copyWith =>
      __$$_FilterJobEventGetCopyWithImpl<_$_FilterJobEventGet>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) get,
  }) {
    return get(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? get,
  }) {
    return get?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterJobEventGet value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilterJobEventGet value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterJobEventGet value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _FilterJobEventGet implements FilterJobEvent {
  const factory _FilterJobEventGet({required final String search}) =
      _$_FilterJobEventGet;

  @override
  String get search;
  @override
  @JsonKey(ignore: true)
  _$$_FilterJobEventGetCopyWith<_$_FilterJobEventGet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilterJobState {
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
    required TResult Function(FilterJobStateInitial value) initial,
    required TResult Function(FilterJobStateLoading value) loading,
    required TResult Function(FilterJobStateLoaded value) loaded,
    required TResult Function(FilterJobStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterJobStateInitial value)? initial,
    TResult? Function(FilterJobStateLoading value)? loading,
    TResult? Function(FilterJobStateLoaded value)? loaded,
    TResult? Function(FilterJobStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterJobStateInitial value)? initial,
    TResult Function(FilterJobStateLoading value)? loading,
    TResult Function(FilterJobStateLoaded value)? loaded,
    TResult Function(FilterJobStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterJobStateCopyWith<$Res> {
  factory $FilterJobStateCopyWith(
          FilterJobState value, $Res Function(FilterJobState) then) =
      _$FilterJobStateCopyWithImpl<$Res, FilterJobState>;
}

/// @nodoc
class _$FilterJobStateCopyWithImpl<$Res, $Val extends FilterJobState>
    implements $FilterJobStateCopyWith<$Res> {
  _$FilterJobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FilterJobStateInitialCopyWith<$Res> {
  factory _$$FilterJobStateInitialCopyWith(_$FilterJobStateInitial value,
          $Res Function(_$FilterJobStateInitial) then) =
      __$$FilterJobStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterJobStateInitialCopyWithImpl<$Res>
    extends _$FilterJobStateCopyWithImpl<$Res, _$FilterJobStateInitial>
    implements _$$FilterJobStateInitialCopyWith<$Res> {
  __$$FilterJobStateInitialCopyWithImpl(_$FilterJobStateInitial _value,
      $Res Function(_$FilterJobStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FilterJobStateInitial implements FilterJobStateInitial {
  const _$FilterJobStateInitial();

  @override
  String toString() {
    return 'FilterJobState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterJobStateInitial);
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
    required TResult Function(FilterJobStateInitial value) initial,
    required TResult Function(FilterJobStateLoading value) loading,
    required TResult Function(FilterJobStateLoaded value) loaded,
    required TResult Function(FilterJobStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterJobStateInitial value)? initial,
    TResult? Function(FilterJobStateLoading value)? loading,
    TResult? Function(FilterJobStateLoaded value)? loaded,
    TResult? Function(FilterJobStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterJobStateInitial value)? initial,
    TResult Function(FilterJobStateLoading value)? loading,
    TResult Function(FilterJobStateLoaded value)? loaded,
    TResult Function(FilterJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FilterJobStateInitial implements FilterJobState {
  const factory FilterJobStateInitial() = _$FilterJobStateInitial;
}

/// @nodoc
abstract class _$$FilterJobStateLoadingCopyWith<$Res> {
  factory _$$FilterJobStateLoadingCopyWith(_$FilterJobStateLoading value,
          $Res Function(_$FilterJobStateLoading) then) =
      __$$FilterJobStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterJobStateLoadingCopyWithImpl<$Res>
    extends _$FilterJobStateCopyWithImpl<$Res, _$FilterJobStateLoading>
    implements _$$FilterJobStateLoadingCopyWith<$Res> {
  __$$FilterJobStateLoadingCopyWithImpl(_$FilterJobStateLoading _value,
      $Res Function(_$FilterJobStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FilterJobStateLoading implements FilterJobStateLoading {
  const _$FilterJobStateLoading();

  @override
  String toString() {
    return 'FilterJobState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterJobStateLoading);
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
    required TResult Function(FilterJobStateInitial value) initial,
    required TResult Function(FilterJobStateLoading value) loading,
    required TResult Function(FilterJobStateLoaded value) loaded,
    required TResult Function(FilterJobStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterJobStateInitial value)? initial,
    TResult? Function(FilterJobStateLoading value)? loading,
    TResult? Function(FilterJobStateLoaded value)? loaded,
    TResult? Function(FilterJobStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterJobStateInitial value)? initial,
    TResult Function(FilterJobStateLoading value)? loading,
    TResult Function(FilterJobStateLoaded value)? loaded,
    TResult Function(FilterJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FilterJobStateLoading implements FilterJobState {
  const factory FilterJobStateLoading() = _$FilterJobStateLoading;
}

/// @nodoc
abstract class _$$FilterJobStateLoadedCopyWith<$Res> {
  factory _$$FilterJobStateLoadedCopyWith(_$FilterJobStateLoaded value,
          $Res Function(_$FilterJobStateLoaded) then) =
      __$$FilterJobStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<JobModel> jobs});
}

/// @nodoc
class __$$FilterJobStateLoadedCopyWithImpl<$Res>
    extends _$FilterJobStateCopyWithImpl<$Res, _$FilterJobStateLoaded>
    implements _$$FilterJobStateLoadedCopyWith<$Res> {
  __$$FilterJobStateLoadedCopyWithImpl(_$FilterJobStateLoaded _value,
      $Res Function(_$FilterJobStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_$FilterJobStateLoaded(
      jobs: null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobModel>,
    ));
  }
}

/// @nodoc

class _$FilterJobStateLoaded implements FilterJobStateLoaded {
  const _$FilterJobStateLoaded({required final List<JobModel> jobs})
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
    return 'FilterJobState.loaded(jobs: $jobs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterJobStateLoaded &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_jobs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterJobStateLoadedCopyWith<_$FilterJobStateLoaded> get copyWith =>
      __$$FilterJobStateLoadedCopyWithImpl<_$FilterJobStateLoaded>(
          this, _$identity);

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
    required TResult Function(FilterJobStateInitial value) initial,
    required TResult Function(FilterJobStateLoading value) loading,
    required TResult Function(FilterJobStateLoaded value) loaded,
    required TResult Function(FilterJobStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterJobStateInitial value)? initial,
    TResult? Function(FilterJobStateLoading value)? loading,
    TResult? Function(FilterJobStateLoaded value)? loaded,
    TResult? Function(FilterJobStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterJobStateInitial value)? initial,
    TResult Function(FilterJobStateLoading value)? loading,
    TResult Function(FilterJobStateLoaded value)? loaded,
    TResult Function(FilterJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FilterJobStateLoaded implements FilterJobState {
  const factory FilterJobStateLoaded({required final List<JobModel> jobs}) =
      _$FilterJobStateLoaded;

  List<JobModel> get jobs;
  @JsonKey(ignore: true)
  _$$FilterJobStateLoadedCopyWith<_$FilterJobStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterJobStateErrorCopyWith<$Res> {
  factory _$$FilterJobStateErrorCopyWith(_$FilterJobStateError value,
          $Res Function(_$FilterJobStateError) then) =
      __$$FilterJobStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterJobStateErrorCopyWithImpl<$Res>
    extends _$FilterJobStateCopyWithImpl<$Res, _$FilterJobStateError>
    implements _$$FilterJobStateErrorCopyWith<$Res> {
  __$$FilterJobStateErrorCopyWithImpl(
      _$FilterJobStateError _value, $Res Function(_$FilterJobStateError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FilterJobStateError implements FilterJobStateError {
  const _$FilterJobStateError();

  @override
  String toString() {
    return 'FilterJobState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterJobStateError);
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
    required TResult Function(FilterJobStateInitial value) initial,
    required TResult Function(FilterJobStateLoading value) loading,
    required TResult Function(FilterJobStateLoaded value) loaded,
    required TResult Function(FilterJobStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterJobStateInitial value)? initial,
    TResult? Function(FilterJobStateLoading value)? loading,
    TResult? Function(FilterJobStateLoaded value)? loaded,
    TResult? Function(FilterJobStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterJobStateInitial value)? initial,
    TResult Function(FilterJobStateLoading value)? loading,
    TResult Function(FilterJobStateLoaded value)? loaded,
    TResult Function(FilterJobStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FilterJobStateError implements FilterJobState {
  const factory FilterJobStateError() = _$FilterJobStateError;
}
