import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_api_request_model.freezed.dart';
part 'login_api_request_model.g.dart';

@freezed
class LoginApiRequestModel with _$LoginApiRequestModel {
  const factory LoginApiRequestModel({
    required String email,
    required String password,
    required String panel,
  }) = _LoginApiRequestModel;

  factory LoginApiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginApiRequestModelFromJson(json);
}
