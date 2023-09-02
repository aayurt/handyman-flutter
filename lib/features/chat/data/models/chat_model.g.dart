// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['_id'] as String?,
      contractor: json['contractor'] == null
          ? null
          : User.fromJson(json['contractor'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : User.fromJson(json['customer'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
      senderId: json['senderId'] as String?,
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'contractor': instance.contractor,
      'customer': instance.customer,
      'msg': instance.msg,
      'senderId': instance.senderId,
    };
