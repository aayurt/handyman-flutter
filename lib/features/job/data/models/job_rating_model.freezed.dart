// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobRatingModel _$JobRatingModelFromJson(Map<String, dynamic> json) {
  return _JobRatingModel.fromJson(json);
}

/// @nodoc
mixin _$JobRatingModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get applicationId => throw _privateConstructorUsedError;
  User? get customerId => throw _privateConstructorUsedError;
  String? get listingId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobRatingModelCopyWith<JobRatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobRatingModelCopyWith<$Res> {
  factory $JobRatingModelCopyWith(
          JobRatingModel value, $Res Function(JobRatingModel) then) =
      _$JobRatingModelCopyWithImpl<$Res, JobRatingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? applicationId,
      User? customerId,
      String? listingId,
      String? note,
      double? value});

  $UserCopyWith<$Res>? get customerId;
}

/// @nodoc
class _$JobRatingModelCopyWithImpl<$Res, $Val extends JobRatingModel>
    implements $JobRatingModelCopyWith<$Res> {
  _$JobRatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? customerId = freezed,
    Object? listingId = freezed,
    Object? note = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as User?,
      listingId: freezed == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get customerId {
    if (_value.customerId == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.customerId!, (value) {
      return _then(_value.copyWith(customerId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JobRatingModelCopyWith<$Res>
    implements $JobRatingModelCopyWith<$Res> {
  factory _$$_JobRatingModelCopyWith(
          _$_JobRatingModel value, $Res Function(_$_JobRatingModel) then) =
      __$$_JobRatingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? applicationId,
      User? customerId,
      String? listingId,
      String? note,
      double? value});

  @override
  $UserCopyWith<$Res>? get customerId;
}

/// @nodoc
class __$$_JobRatingModelCopyWithImpl<$Res>
    extends _$JobRatingModelCopyWithImpl<$Res, _$_JobRatingModel>
    implements _$$_JobRatingModelCopyWith<$Res> {
  __$$_JobRatingModelCopyWithImpl(
      _$_JobRatingModel _value, $Res Function(_$_JobRatingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? customerId = freezed,
    Object? listingId = freezed,
    Object? note = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_JobRatingModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as User?,
      listingId: freezed == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobRatingModel implements _JobRatingModel {
  const _$_JobRatingModel(
      {@JsonKey(name: '_id') this.id,
      this.applicationId,
      this.customerId,
      this.listingId,
      this.note,
      this.value});

  factory _$_JobRatingModel.fromJson(Map<String, dynamic> json) =>
      _$$_JobRatingModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? applicationId;
  @override
  final User? customerId;
  @override
  final String? listingId;
  @override
  final String? note;
  @override
  final double? value;

  @override
  String toString() {
    return 'JobRatingModel(id: $id, applicationId: $applicationId, customerId: $customerId, listingId: $listingId, note: $note, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobRatingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, applicationId, customerId, listingId, note, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobRatingModelCopyWith<_$_JobRatingModel> get copyWith =>
      __$$_JobRatingModelCopyWithImpl<_$_JobRatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobRatingModelToJson(
      this,
    );
  }
}

abstract class _JobRatingModel implements JobRatingModel {
  const factory _JobRatingModel(
      {@JsonKey(name: '_id') final String? id,
      final String? applicationId,
      final User? customerId,
      final String? listingId,
      final String? note,
      final double? value}) = _$_JobRatingModel;

  factory _JobRatingModel.fromJson(Map<String, dynamic> json) =
      _$_JobRatingModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get applicationId;
  @override
  User? get customerId;
  @override
  String? get listingId;
  @override
  String? get note;
  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$_JobRatingModelCopyWith<_$_JobRatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
