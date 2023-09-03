import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/login/data/models/login_api_response_model.dart';
part 'job_rating_model.freezed.dart';
part 'job_rating_model.g.dart';

@freezed
class JobRatingModel with _$JobRatingModel {
  const factory JobRatingModel({
    @JsonKey(name: '_id') String? id,
    String? applicationId,
    User? customerId,
    String? listingId,
    String? note,
    double? value,
  }) = _JobRatingModel;

  factory JobRatingModel.fromJson(Map<String, dynamic> json) =>
      _$JobRatingModelFromJson(json);
}
