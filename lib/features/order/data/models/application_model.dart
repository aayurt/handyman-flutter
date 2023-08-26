import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/login/data/models/login_api_response_model.dart';
part 'application_model.freezed.dart';
part 'application_model.g.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'listing') JobModel? listing,
    @JsonKey(name: 'customer') User? customer,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'paymentMethod') String? paymentMethod,
    @JsonKey(name: 'paymentStatus') String? paymentStatus,
    @JsonKey(name: 'appDate') DateTime? appDate,
    @JsonKey(name: 'closeDate') DateTime? closeDate,
    @JsonKey(name: 'selectedTimeSlots')
    Map<String, List<String>>? selectedTimeSlots,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
}
