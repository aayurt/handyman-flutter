import 'package:handyman/features/login/domain/repositories/login.repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../datasources/login.datasource.dart';
import '../models/login_api_response_model.dart';
import '../models/login_api_request_model.dart';

class LoginUserRepositoryImpl implements LoginUserRepository {
  @override
  Future<Either<Failure, LoginApiResponseModel>> login(
      {required LoginApiRequestModel param}) {
    // ! FROM DB
    // ! FROM API
    return serviceLocator<LoginRemoteDataSource>().loginUser(
      param: param,
    );
  }
  //
}
