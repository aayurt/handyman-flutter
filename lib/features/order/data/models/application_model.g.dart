// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationModel _$$_ApplicationModelFromJson(Map<String, dynamic> json) =>
    _$_ApplicationModel(
      id: json['_id'] as String?,
      listing: json['listing'] == null
          ? null
          : JobModel.fromJson(json['listing'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : User.fromJson(json['customer'] as Map<String, dynamic>),
      status: json['status'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      appDate: json['appDate'] == null
          ? null
          : DateTime.parse(json['appDate'] as String),
      closeDate: json['closeDate'] == null
          ? null
          : DateTime.parse(json['closeDate'] as String),
      selectedTimeSlots:
          (json['selectedTimeSlots'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$$_ApplicationModelToJson(_$_ApplicationModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'listing': instance.listing,
      'customer': instance.customer,
      'status': instance.status,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
      'appDate': instance.appDate?.toIso8601String(),
      'closeDate': instance.closeDate?.toIso8601String(),
      'selectedTimeSlots': instance.selectedTimeSlots,
    };
