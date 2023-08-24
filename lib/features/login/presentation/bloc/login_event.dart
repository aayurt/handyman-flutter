import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/login_api_request_model.dart';
part 'login_event.freezed.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onLogin({required LoginApiRequestModel param}) =
      OnLogin;
}
