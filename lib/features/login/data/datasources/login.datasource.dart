import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/features/login/data/models/login_api_request_model.dart';
import 'package:handyman/features/login/data/models/login_api_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/failure/failure.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginApiResponseModel>> loginUser(
      {required LoginApiRequestModel param});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService request = ApiService();

  @override
  Future<Either<Failure, LoginApiResponseModel>> loginUser(
      {required LoginApiRequestModel param}) async {
    try {
      final String baseUrl = AppConstants.baseUrl;
      if (baseUrl.isNotEmpty) {
        final response = await request.post(
          ApiEndpoint(
              baseUrl,
              param.panel == "contractor"
                  ? ApiList.contractorLogin
                  : ApiList.customerLogin,
              {}),
          data: param.toJson(),
        );
        if (response.statusCode == 200) {
          final token = response.data;

          if (token!.isNotEmpty) {
            if (kDebugMode) {}
          }

          return Right(LoginApiResponseModel.fromJson(response.data));
        } else if (response.statusCode == 401) {
          return Left(ConnectionFailure(response.data));
        }
        return Left(ConnectionFailure(response.data['message']));
      }
      return const Left(ConnectionFailure("BaseUrl not found"));
    } catch (e) {
      debugPrint('LoginRemoteDataSourceImplError $e');
      return const Left(
        Exception('Exception Occured in LoginRemoteDataSourceImpl'),
      );
    }
  }
}
