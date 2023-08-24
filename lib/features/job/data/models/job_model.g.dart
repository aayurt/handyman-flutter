// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobModel _$$_JobModelFromJson(Map<String, dynamic> json) => _$_JobModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      numApps: json['numApps'] as int?,
      numAccepted: json['numAccepted'] as int?,
      deadlineDate: json['deadlineDate'] == null
          ? null
          : DateTime.parse(json['deadlineDate'] as String),
      duration: json['duration'] as int?,
      payRate: (json['payRate'] as num?)?.toDouble(),
      numRatings: json['numRatings'] as int?,
      ratingSum: json['ratingSum'] as int?,
      deleted: json['deleted'] as bool?,
      thumbnailImage: json['thumbnailImage'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      contractor: json['contractor'] == null
          ? null
          : User.fromJson(json['contractor'] as Map<String, dynamic>),
      postingDate: json['postingDate'] == null
          ? null
          : DateTime.parse(json['postingDate'] as String),
    );

Map<String, dynamic> _$$_JobModelToJson(_$_JobModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'numApps': instance.numApps,
      'numAccepted': instance.numAccepted,
      'deadlineDate': instance.deadlineDate?.toIso8601String(),
      'duration': instance.duration,
      'payRate': instance.payRate,
      'numRatings': instance.numRatings,
      'ratingSum': instance.ratingSum,
      'deleted': instance.deleted,
      'thumbnailImage': instance.thumbnailImage,
      'category': instance.category,
      'contractor': instance.contractor,
      'postingDate': instance.postingDate?.toIso8601String(),
    };

_$_ResponseJobModel _$$_ResponseJobModelFromJson(Map<String, dynamic> json) =>
    _$_ResponseJobModel(
      status: json['status'] as bool?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => JobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_ResponseJobModelToJson(_$_ResponseJobModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'products': instance.products,
      'message': instance.message,
    };
