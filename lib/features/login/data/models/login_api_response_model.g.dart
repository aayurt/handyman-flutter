// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginApiResponseModel _$$_LoginApiResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoginApiResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      userType: json['userType'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginApiResponseModelToJson(
        _$_LoginApiResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'userType': instance.userType,
      'user': instance.user,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      bio: json['bio'] as String?,
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      linkedIn: json['linkedIn'] as String?,
      fcmToken: json['fcmToken'] as String?,
      github: json['github'] as String?,
      website: json['website'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      experiences: (json['experiences'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      numRatings: json['numRatings'] as int?,
      ratingSum: json['ratingSum'] as int?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'location': instance.location,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'bio': instance.bio,
      'avatar': instance.avatar,
      'address': instance.address,
      'linkedIn': instance.linkedIn,
      'fcmToken': instance.fcmToken,
      'github': instance.github,
      'website': instance.website,
      'skills': instance.skills,
      'interests': instance.interests,
      'experiences': instance.experiences,
      'education': instance.education,
      'numRatings': instance.numRatings,
      'ratingSum': instance.ratingSum,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_$_Experience _$$_ExperienceFromJson(Map<String, dynamic> json) =>
    _$_Experience(
      employerName: json['employerName'] as String?,
      startYear: json['startYear'] as String?,
      role: json['role'] as String?,
      endYear: json['endYear'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$_ExperienceToJson(_$_Experience instance) =>
    <String, dynamic>{
      'employerName': instance.employerName,
      'startYear': instance.startYear,
      'role': instance.role,
      'endYear': instance.endYear,
      '_id': instance.id,
    };

_$_Education _$$_EducationFromJson(Map<String, dynamic> json) => _$_Education(
      instituteName: json['instituteName'] as String?,
      startYear: json['startYear'] as String?,
      endYear: json['endYear'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$_EducationToJson(_$_Education instance) =>
    <String, dynamic>{
      'instituteName': instance.instituteName,
      'startYear': instance.startYear,
      'endYear': instance.endYear,
      '_id': instance.id,
    };
