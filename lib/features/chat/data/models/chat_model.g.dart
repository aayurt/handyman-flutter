// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['_id'] as String?,
      contractorId: json['contractorId'] as String?,
      customerId: json['customerId'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'contractorId': instance.contractorId,
      'customerId': instance.customerId,
      'msg': instance.msg,
    };
