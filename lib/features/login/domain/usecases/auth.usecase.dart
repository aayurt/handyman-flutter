import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../data/models/login_api_request_model.dart';
import '../../data/models/login_api_response_model.dart';
import '../repositories/login.repository.dart';

class LoginUserUsecase {
  Future<Either<Failure, LoginApiResponseModel>> loginUser(
      LoginApiRequestModel param) async {
    final response =
        await serviceLocator<LoginUserRepository>().login(param: param);
    if (response.isRight()) {
      final remoteUserResponse =
          response.getOrElse(() => const LoginApiResponseModel());
      if (kDebugMode) {
        print("remoteUserResponse=>$remoteUserResponse");
      }
    }
    return response;
  }
}
