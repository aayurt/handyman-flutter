// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobModel _$JobModelFromJson(Map<String, dynamic> json) {
  return _JobModel.fromJson(json);
}

/// @nodoc
mixin _$JobModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get numApps => throw _privateConstructorUsedError;
  int? get numAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'deadlineDate')
  DateTime? get deadlineDate => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  double? get payRate => throw _privateConstructorUsedError;
  int? get numRatings => throw _privateConstructorUsedError;
  int? get ratingSum => throw _privateConstructorUsedError;
  bool? get deleted => throw _privateConstructorUsedError;
  String? get thumbnailImage => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  User? get contractor => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'postingDate')
  DateTime? get postingDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobModelCopyWith<JobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobModelCopyWith<$Res> {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) then) =
      _$JobModelCopyWithImpl<$Res, JobModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      int? numApps,
      int? numAccepted,
      @JsonKey(name: 'deadlineDate') DateTime? deadlineDate,
      int? duration,
      double? payRate,
      int? numRatings,
      int? ratingSum,
      bool? deleted,
      String? thumbnailImage,
      CategoryModel? category,
      User? contractor,
      double? rating,
      @JsonKey(name: 'postingDate') DateTime? postingDate});

  $CategoryModelCopyWith<$Res>? get category;
  $UserCopyWith<$Res>? get contractor;
}

/// @nodoc
class _$JobModelCopyWithImpl<$Res, $Val extends JobModel>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? numApps = freezed,
    Object? numAccepted = freezed,
    Object? deadlineDate = freezed,
    Object? duration = freezed,
    Object? payRate = freezed,
    Object? numRatings = freezed,
    Object? ratingSum = freezed,
    Object? deleted = freezed,
    Object? thumbnailImage = freezed,
    Object? category = freezed,
    Object? contractor = freezed,
    Object? rating = freezed,
    Object? postingDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      numApps: freezed == numApps
          ? _value.numApps
          : numApps // ignore: cast_nullable_to_non_nullable
              as int?,
      numAccepted: freezed == numAccepted
          ? _value.numAccepted
          : numAccepted // ignore: cast_nullable_to_non_nullable
              as int?,
      deadlineDate: freezed == deadlineDate
          ? _value.deadlineDate
          : deadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      payRate: freezed == payRate
          ? _value.payRate
          : payRate // ignore: cast_nullable_to_non_nullable
              as double?,
      numRatings: freezed == numRatings
          ? _value.numRatings
          : numRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingSum: freezed == ratingSum
          ? _value.ratingSum
          : ratingSum // ignore: cast_nullable_to_non_nullable
              as int?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      contractor: freezed == contractor
          ? _value.contractor
          : contractor // ignore: cast_nullable_to_non_nullable
              as User?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      postingDate: freezed == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get contractor {
    if (_value.contractor == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.contractor!, (value) {
      return _then(_value.copyWith(contractor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JobModelCopyWith<$Res> implements $JobModelCopyWith<$Res> {
  factory _$$_JobModelCopyWith(
          _$_JobModel value, $Res Function(_$_JobModel) then) =
      __$$_JobModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      int? numApps,
      int? numAccepted,
      @JsonKey(name: 'deadlineDate') DateTime? deadlineDate,
      int? duration,
      double? payRate,
      int? numRatings,
      int? ratingSum,
      bool? deleted,
      String? thumbnailImage,
      CategoryModel? category,
      User? contractor,
      double? rating,
      @JsonKey(name: 'postingDate') DateTime? postingDate});

  @override
  $CategoryModelCopyWith<$Res>? get category;
  @override
  $UserCopyWith<$Res>? get contractor;
}

/// @nodoc
class __$$_JobModelCopyWithImpl<$Res>
    extends _$JobModelCopyWithImpl<$Res, _$_JobModel>
    implements _$$_JobModelCopyWith<$Res> {
  __$$_JobModelCopyWithImpl(
      _$_JobModel _value, $Res Function(_$_JobModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? numApps = freezed,
    Object? numAccepted = freezed,
    Object? deadlineDate = freezed,
    Object? duration = freezed,
    Object? payRate = freezed,
    Object? numRatings = freezed,
    Object? ratingSum = freezed,
    Object? deleted = freezed,
    Object? thumbnailImage = freezed,
    Object? category = freezed,
    Object? contractor = freezed,
    Object? rating = freezed,
    Object? postingDate = freezed,
  }) {
    return _then(_$_JobModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      numApps: freezed == numApps
          ? _value.numApps
          : numApps // ignore: cast_nullable_to_non_nullable
              as int?,
      numAccepted: freezed == numAccepted
          ? _value.numAccepted
          : numAccepted // ignore: cast_nullable_to_non_nullable
              as int?,
      deadlineDate: freezed == deadlineDate
          ? _value.deadlineDate
          : deadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      payRate: freezed == payRate
          ? _value.payRate
          : payRate // ignore: cast_nullable_to_non_nullable
              as double?,
      numRatings: freezed == numRatings
          ? _value.numRatings
          : numRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingSum: freezed == ratingSum
          ? _value.ratingSum
          : ratingSum // ignore: cast_nullable_to_non_nullable
              as int?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      contractor: freezed == contractor
          ? _value.contractor
          : contractor // ignore: cast_nullable_to_non_nullable
              as User?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      postingDate: freezed == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobModel implements _JobModel {
  _$_JobModel(
      {@JsonKey(name: '_id') this.id,
      this.title,
      this.numApps,
      this.numAccepted,
      @JsonKey(name: 'deadlineDate') this.deadlineDate,
      this.duration,
      this.payRate,
      this.numRatings,
      this.ratingSum,
      this.deleted,
      this.thumbnailImage,
      this.category,
      this.contractor,
      this.rating,
      @JsonKey(name: 'postingDate') this.postingDate});

  factory _$_JobModel.fromJson(Map<String, dynamic> json) =>
      _$$_JobModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;
  @override
  final int? numApps;
  @override
  final int? numAccepted;
  @override
  @JsonKey(name: 'deadlineDate')
  final DateTime? deadlineDate;
  @override
  final int? duration;
  @override
  final double? payRate;
  @override
  final int? numRatings;
  @override
  final int? ratingSum;
  @override
  final bool? deleted;
  @override
  final String? thumbnailImage;
  @override
  final CategoryModel? category;
  @override
  final User? contractor;
  @override
  final double? rating;
  @override
  @JsonKey(name: 'postingDate')
  final DateTime? postingDate;

  @override
  String toString() {
    return 'JobModel(id: $id, title: $title, numApps: $numApps, numAccepted: $numAccepted, deadlineDate: $deadlineDate, duration: $duration, payRate: $payRate, numRatings: $numRatings, ratingSum: $ratingSum, deleted: $deleted, thumbnailImage: $thumbnailImage, category: $category, contractor: $contractor, rating: $rating, postingDate: $postingDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.numApps, numApps) || other.numApps == numApps) &&
            (identical(other.numAccepted, numAccepted) ||
                other.numAccepted == numAccepted) &&
            (identical(other.deadlineDate, deadlineDate) ||
                other.deadlineDate == deadlineDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.payRate, payRate) || other.payRate == payRate) &&
            (identical(other.numRatings, numRatings) ||
                other.numRatings == numRatings) &&
            (identical(other.ratingSum, ratingSum) ||
                other.ratingSum == ratingSum) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.contractor, contractor) ||
                other.contractor == contractor) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      numApps,
      numAccepted,
      deadlineDate,
      duration,
      payRate,
      numRatings,
      ratingSum,
      deleted,
      thumbnailImage,
      category,
      contractor,
      rating,
      postingDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobModelCopyWith<_$_JobModel> get copyWith =>
      __$$_JobModelCopyWithImpl<_$_JobModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobModelToJson(
      this,
    );
  }
}

abstract class _JobModel implements JobModel {
  factory _JobModel(
      {@JsonKey(name: '_id') final String? id,
      final String? title,
      final int? numApps,
      final int? numAccepted,
      @JsonKey(name: 'deadlineDate') final DateTime? deadlineDate,
      final int? duration,
      final double? payRate,
      final int? numRatings,
      final int? ratingSum,
      final bool? deleted,
      final String? thumbnailImage,
      final CategoryModel? category,
      final User? contractor,
      final double? rating,
      @JsonKey(name: 'postingDate') final DateTime? postingDate}) = _$_JobModel;

  factory _JobModel.fromJson(Map<String, dynamic> json) = _$_JobModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get title;
  @override
  int? get numApps;
  @override
  int? get numAccepted;
  @override
  @JsonKey(name: 'deadlineDate')
  DateTime? get deadlineDate;
  @override
  int? get duration;
  @override
  double? get payRate;
  @override
  int? get numRatings;
  @override
  int? get ratingSum;
  @override
  bool? get deleted;
  @override
  String? get thumbnailImage;
  @override
  CategoryModel? get category;
  @override
  User? get contractor;
  @override
  double? get rating;
  @override
  @JsonKey(name: 'postingDate')
  DateTime? get postingDate;
  @override
  @JsonKey(ignore: true)
  _$$_JobModelCopyWith<_$_JobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseJobModel _$ResponseJobModelFromJson(Map<String, dynamic> json) {
  return _ResponseJobModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseJobModel {
  bool? get status => throw _privateConstructorUsedError;
  List<JobModel>? get products => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseJobModelCopyWith<ResponseJobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseJobModelCopyWith<$Res> {
  factory $ResponseJobModelCopyWith(
          ResponseJobModel value, $Res Function(ResponseJobModel) then) =
      _$ResponseJobModelCopyWithImpl<$Res, ResponseJobModel>;
  @useResult
  $Res call({bool? status, List<JobModel>? products, String? message});
}

/// @nodoc
class _$ResponseJobModelCopyWithImpl<$Res, $Val extends ResponseJobModel>
    implements $ResponseJobModelCopyWith<$Res> {
  _$ResponseJobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? products = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<JobModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseJobModelCopyWith<$Res>
    implements $ResponseJobModelCopyWith<$Res> {
  factory _$$_ResponseJobModelCopyWith(
          _$_ResponseJobModel value, $Res Function(_$_ResponseJobModel) then) =
      __$$_ResponseJobModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<JobModel>? products, String? message});
}

/// @nodoc
class __$$_ResponseJobModelCopyWithImpl<$Res>
    extends _$ResponseJobModelCopyWithImpl<$Res, _$_ResponseJobModel>
    implements _$$_ResponseJobModelCopyWith<$Res> {
  __$$_ResponseJobModelCopyWithImpl(
      _$_ResponseJobModel _value, $Res Function(_$_ResponseJobModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? products = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ResponseJobModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<JobModel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseJobModel implements _ResponseJobModel {
  _$_ResponseJobModel(
      {this.status, final List<JobModel>? products, this.message})
      : _products = products;

  factory _$_ResponseJobModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseJobModelFromJson(json);

  @override
  final bool? status;
  final List<JobModel>? _products;
  @override
  List<JobModel>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'ResponseJobModel(status: $status, products: $products, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseJobModel &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_products), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseJobModelCopyWith<_$_ResponseJobModel> get copyWith =>
      __$$_ResponseJobModelCopyWithImpl<_$_ResponseJobModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseJobModelToJson(
      this,
    );
  }
}

abstract class _ResponseJobModel implements ResponseJobModel {
  factory _ResponseJobModel(
      {final bool? status,
      final List<JobModel>? products,
      final String? message}) = _$_ResponseJobModel;

  factory _ResponseJobModel.fromJson(Map<String, dynamic> json) =
      _$_ResponseJobModel.fromJson;

  @override
  bool? get status;
  @override
  List<JobModel>? get products;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseJobModelCopyWith<_$_ResponseJobModel> get copyWith =>
      throw _privateConstructorUsedError;
}
