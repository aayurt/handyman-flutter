// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_api_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginApiRequestModel _$LoginApiRequestModelFromJson(Map<String, dynamic> json) {
  return _LoginApiRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LoginApiRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get panel => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginApiRequestModelCopyWith<LoginApiRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginApiRequestModelCopyWith<$Res> {
  factory $LoginApiRequestModelCopyWith(LoginApiRequestModel value,
          $Res Function(LoginApiRequestModel) then) =
      _$LoginApiRequestModelCopyWithImpl<$Res, LoginApiRequestModel>;
  @useResult
  $Res call({String email, String password, String panel, String? fcmToken});
}

/// @nodoc
class _$LoginApiRequestModelCopyWithImpl<$Res,
        $Val extends LoginApiRequestModel>
    implements $LoginApiRequestModelCopyWith<$Res> {
  _$LoginApiRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? panel = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      panel: null == panel
          ? _value.panel
          : panel // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginApiRequestModelCopyWith<$Res>
    implements $LoginApiRequestModelCopyWith<$Res> {
  factory _$$_LoginApiRequestModelCopyWith(_$_LoginApiRequestModel value,
          $Res Function(_$_LoginApiRequestModel) then) =
      __$$_LoginApiRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String panel, String? fcmToken});
}

/// @nodoc
class __$$_LoginApiRequestModelCopyWithImpl<$Res>
    extends _$LoginApiRequestModelCopyWithImpl<$Res, _$_LoginApiRequestModel>
    implements _$$_LoginApiRequestModelCopyWith<$Res> {
  __$$_LoginApiRequestModelCopyWithImpl(_$_LoginApiRequestModel _value,
      $Res Function(_$_LoginApiRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? panel = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_$_LoginApiRequestModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      panel: null == panel
          ? _value.panel
          : panel // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginApiRequestModel implements _LoginApiRequestModel {
  const _$_LoginApiRequestModel(
      {required this.email,
      required this.password,
      required this.panel,
      this.fcmToken});

  factory _$_LoginApiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginApiRequestModelFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String panel;
  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'LoginApiRequestModel(email: $email, password: $password, panel: $panel, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginApiRequestModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.panel, panel) || other.panel == panel) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, panel, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginApiRequestModelCopyWith<_$_LoginApiRequestModel> get copyWith =>
      __$$_LoginApiRequestModelCopyWithImpl<_$_LoginApiRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginApiRequestModelToJson(
      this,
    );
  }
}

abstract class _LoginApiRequestModel implements LoginApiRequestModel {
  const factory _LoginApiRequestModel(
      {required final String email,
      required final String password,
      required final String panel,
      final String? fcmToken}) = _$_LoginApiRequestModel;

  factory _LoginApiRequestModel.fromJson(Map<String, dynamic> json) =
      _$_LoginApiRequestModel.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get panel;
  @override
  String? get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$_LoginApiRequestModelCopyWith<_$_LoginApiRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
