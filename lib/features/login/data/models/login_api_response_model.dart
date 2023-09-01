import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_api_response_model.freezed.dart';
part 'login_api_response_model.g.dart';

@freezed
class LoginApiResponseModel with _$LoginApiResponseModel {
  const factory LoginApiResponseModel({
    bool? status,
    String? message,
    String? accessToken,
    String? userType,
    User? user,
  }) = _LoginApiResponseModel;

  factory LoginApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseModelFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: 'location') Location? location,
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'bio') String? bio,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'linkedIn') String? linkedIn,
    @JsonKey(name: 'fcmToken') String? fcmToken,
    @JsonKey(name: 'github') String? github,
    @JsonKey(name: 'website') String? website,
    @JsonKey(name: 'skills') List<String>? skills,
    @JsonKey(name: 'interests') List<String>? interests,
    @JsonKey(name: 'experiences') List<Experience>? experiences,
    @JsonKey(name: 'education') List<Education>? education,
    @JsonKey(name: 'numRatings') int? numRatings,
    @JsonKey(name: 'ratingSum') int? ratingSum,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Location with _$Location {
  const factory Location({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'coordinates') List<double>? coordinates,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
abstract class Experience with _$Experience {
  const factory Experience({
    @JsonKey(name: 'employerName') String? employerName,
    @JsonKey(name: 'startYear') String? startYear,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'endYear') String? endYear,
    @JsonKey(name: '_id') String? id,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@freezed
abstract class Education with _$Education {
  const factory Education({
    @JsonKey(name: 'instituteName') String? instituteName,
    @JsonKey(name: 'startYear') String? startYear,
    @JsonKey(name: 'endYear') String? endYear,
    @JsonKey(name: '_id') String? id,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
