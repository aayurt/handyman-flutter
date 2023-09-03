// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobRatingModel _$$_JobRatingModelFromJson(Map<String, dynamic> json) =>
    _$_JobRatingModel(
      id: json['_id'] as String?,
      applicationId: json['applicationId'] as String?,
      customerId: json['customerId'] == null
          ? null
          : User.fromJson(json['customerId'] as Map<String, dynamic>),
      listingId: json['listingId'] as String?,
      note: json['note'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_JobRatingModelToJson(_$_JobRatingModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'applicationId': instance.applicationId,
      'customerId': instance.customerId,
      'listingId': instance.listingId,
      'note': instance.note,
      'value': instance.value,
    };
