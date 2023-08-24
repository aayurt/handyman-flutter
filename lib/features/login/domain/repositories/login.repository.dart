import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../data/models/login_api_request_model.dart';
import '../../data/models/login_api_response_model.dart';

abstract class LoginUserRepository {
  Future<Either<Failure, LoginApiResponseModel>> login(
      {required LoginApiRequestModel param});
}
