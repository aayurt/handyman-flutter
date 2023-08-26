// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) {
  return _ApplicationModel.fromJson(json);
}

/// @nodoc
mixin _$ApplicationModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing')
  JobModel? get listing => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  User? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentStatus')
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'appDate')
  DateTime? get appDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'closeDate')
  DateTime? get closeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'selectedTimeSlots')
  Map<String, List<String>>? get selectedTimeSlots =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationModelCopyWith<ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelCopyWith<$Res> {
  factory $ApplicationModelCopyWith(
          ApplicationModel value, $Res Function(ApplicationModel) then) =
      _$ApplicationModelCopyWithImpl<$Res, ApplicationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'listing') JobModel? listing,
      @JsonKey(name: 'customer') User? customer,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'paymentMethod') String? paymentMethod,
      @JsonKey(name: 'paymentStatus') String? paymentStatus,
      @JsonKey(name: 'appDate') DateTime? appDate,
      @JsonKey(name: 'closeDate') DateTime? closeDate,
      @JsonKey(name: 'selectedTimeSlots')
      Map<String, List<String>>? selectedTimeSlots});

  $JobModelCopyWith<$Res>? get listing;
  $UserCopyWith<$Res>? get customer;
}

/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res, $Val extends ApplicationModel>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? listing = freezed,
    Object? customer = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? appDate = freezed,
    Object? closeDate = freezed,
    Object? selectedTimeSlots = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      listing: freezed == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as JobModel?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      appDate: freezed == appDate
          ? _value.appDate
          : appDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeDate: freezed == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedTimeSlots: freezed == selectedTimeSlots
          ? _value.selectedTimeSlots
          : selectedTimeSlots // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JobModelCopyWith<$Res>? get listing {
    if (_value.listing == null) {
      return null;
    }

    return $JobModelCopyWith<$Res>(_value.listing!, (value) {
      return _then(_value.copyWith(listing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApplicationModelCopyWith<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  factory _$$_ApplicationModelCopyWith(
          _$_ApplicationModel value, $Res Function(_$_ApplicationModel) then) =
      __$$_ApplicationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'listing') JobModel? listing,
      @JsonKey(name: 'customer') User? customer,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'paymentMethod') String? paymentMethod,
      @JsonKey(name: 'paymentStatus') String? paymentStatus,
      @JsonKey(name: 'appDate') DateTime? appDate,
      @JsonKey(name: 'closeDate') DateTime? closeDate,
      @JsonKey(name: 'selectedTimeSlots')
      Map<String, List<String>>? selectedTimeSlots});

  @override
  $JobModelCopyWith<$Res>? get listing;
  @override
  $UserCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$_ApplicationModelCopyWithImpl<$Res>
    extends _$ApplicationModelCopyWithImpl<$Res, _$_ApplicationModel>
    implements _$$_ApplicationModelCopyWith<$Res> {
  __$$_ApplicationModelCopyWithImpl(
      _$_ApplicationModel _value, $Res Function(_$_ApplicationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? listing = freezed,
    Object? customer = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? appDate = freezed,
    Object? closeDate = freezed,
    Object? selectedTimeSlots = freezed,
  }) {
    return _then(_$_ApplicationModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      listing: freezed == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as JobModel?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      appDate: freezed == appDate
          ? _value.appDate
          : appDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeDate: freezed == closeDate
          ? _value.closeDate
          : closeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedTimeSlots: freezed == selectedTimeSlots
          ? _value._selectedTimeSlots
          : selectedTimeSlots // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicationModel implements _ApplicationModel {
  const _$_ApplicationModel(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'listing') this.listing,
      @JsonKey(name: 'customer') this.customer,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'paymentMethod') this.paymentMethod,
      @JsonKey(name: 'paymentStatus') this.paymentStatus,
      @JsonKey(name: 'appDate') this.appDate,
      @JsonKey(name: 'closeDate') this.closeDate,
      @JsonKey(name: 'selectedTimeSlots')
      final Map<String, List<String>>? selectedTimeSlots})
      : _selectedTimeSlots = selectedTimeSlots;

  factory _$_ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicationModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'listing')
  final JobModel? listing;
  @override
  @JsonKey(name: 'customer')
  final User? customer;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'paymentMethod')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'paymentStatus')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'appDate')
  final DateTime? appDate;
  @override
  @JsonKey(name: 'closeDate')
  final DateTime? closeDate;
  final Map<String, List<String>>? _selectedTimeSlots;
  @override
  @JsonKey(name: 'selectedTimeSlots')
  Map<String, List<String>>? get selectedTimeSlots {
    final value = _selectedTimeSlots;
    if (value == null) return null;
    if (_selectedTimeSlots is EqualUnmodifiableMapView)
      return _selectedTimeSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApplicationModel(id: $id, listing: $listing, customer: $customer, status: $status, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, appDate: $appDate, closeDate: $closeDate, selectedTimeSlots: $selectedTimeSlots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listing, listing) || other.listing == listing) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.appDate, appDate) || other.appDate == appDate) &&
            (identical(other.closeDate, closeDate) ||
                other.closeDate == closeDate) &&
            const DeepCollectionEquality()
                .equals(other._selectedTimeSlots, _selectedTimeSlots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      listing,
      customer,
      status,
      paymentMethod,
      paymentStatus,
      appDate,
      closeDate,
      const DeepCollectionEquality().hash(_selectedTimeSlots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicationModelCopyWith<_$_ApplicationModel> get copyWith =>
      __$$_ApplicationModelCopyWithImpl<_$_ApplicationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicationModelToJson(
      this,
    );
  }
}

abstract class _ApplicationModel implements ApplicationModel {
  const factory _ApplicationModel(
          {@JsonKey(name: '_id') final String? id,
          @JsonKey(name: 'listing') final JobModel? listing,
          @JsonKey(name: 'customer') final User? customer,
          @JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'paymentMethod') final String? paymentMethod,
          @JsonKey(name: 'paymentStatus') final String? paymentStatus,
          @JsonKey(name: 'appDate') final DateTime? appDate,
          @JsonKey(name: 'closeDate') final DateTime? closeDate,
          @JsonKey(name: 'selectedTimeSlots')
          final Map<String, List<String>>? selectedTimeSlots}) =
      _$_ApplicationModel;

  factory _ApplicationModel.fromJson(Map<String, dynamic> json) =
      _$_ApplicationModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'listing')
  JobModel? get listing;
  @override
  @JsonKey(name: 'customer')
  User? get customer;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'paymentMethod')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'paymentStatus')
  String? get paymentStatus;
  @override
  @JsonKey(name: 'appDate')
  DateTime? get appDate;
  @override
  @JsonKey(name: 'closeDate')
  DateTime? get closeDate;
  @override
  @JsonKey(name: 'selectedTimeSlots')
  Map<String, List<String>>? get selectedTimeSlots;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationModelCopyWith<_$_ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
