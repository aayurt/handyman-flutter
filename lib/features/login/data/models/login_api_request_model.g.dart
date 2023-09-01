// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginApiRequestModel _$$_LoginApiRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoginApiRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      panel: json['panel'] as String,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$_LoginApiRequestModelToJson(
        _$_LoginApiRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'panel': instance.panel,
      'fcmToken': instance.fcmToken,
    };
