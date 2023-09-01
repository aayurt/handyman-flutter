import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/login/data/models/login_api_response_model.dart';

import 'category_model.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

@freezed
class JobModel with _$JobModel {
  factory JobModel({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? description,
    int? numApps,
    int? numAccepted,
    @JsonKey(name: 'deadlineDate') DateTime? deadlineDate,
    int? duration,
    double? payRate,
    int? numRatings,
    int? ratingSum,
    bool? deleted,
    String? thumbnailImage,
    CategoryModel? category,
    User? contractor,
    double? rating,
    @JsonKey(name: 'postingDate') DateTime? postingDate,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}

@freezed
class ResponseJobModel with _$ResponseJobModel {
  factory ResponseJobModel(
      {bool? status,
      List<JobModel>? products,
      String? message}) = _ResponseJobModel;

  factory ResponseJobModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseJobModelFromJson(json);
}
