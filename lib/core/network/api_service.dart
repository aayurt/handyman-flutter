import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiEndpoint {
  final String baseUrl;
  final String path;
  final Map<String, dynamic> queryParameters;

  ApiEndpoint(this.baseUrl, this.path, this.queryParameters);
}

class ApiService {
  final Dio _dio = Dio();
  ApiService() {
    // updateAuthorization();
    updateDioInterceptors();
  }

  // void updateAuthorization() async {}

  void updateDioInterceptors() {
    _dio.options = BaseOptions(
      receiveDataWhenStatusError: true,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    _dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final getToken =
                await SharedPrefService.getToken(SharedPrefKey.token);
            options.headers['Authorization'] = "Bearer $getToken";
            return (handler.next(options));
          },
          onError: (e, handler) {
            if (e.response?.statusCode == 422) {
              //logout user and go to login page
            }
            if (e.response?.statusCode == 402) {
              //logout user and go to login page
            }
            return handler.next(e);
          },
          onResponse: (response, handler) async {
            if (response.statusCode == 400 || response.statusCode == 500) {
              // await SharedPrefService.storeToken(SharedPrefKey.token, "");
              // await SharedPrefService.storeToken(SharedPrefKey.userType, "");
            }

            return (handler.next(response));
          },
        ),
      );
  }

  Future<Response> get(ApiEndpoint endpoint) async {
    final url = endpoint.baseUrl + endpoint.path;
    return _dio.get(url, queryParameters: endpoint.queryParameters);
  }

  Future<Response> post(ApiEndpoint endpoint, {Object? data}) async {
    final url = endpoint.baseUrl + endpoint.path;
    return _dio.post(url,
        queryParameters: endpoint.queryParameters, data: data);
  }

  Future<Response> patch(ApiEndpoint endpoint, {Object? data}) async {
    final url = endpoint.baseUrl + endpoint.path;
    return _dio.patch(url,
        queryParameters: endpoint.queryParameters, data: data);
  }

  Future<Response> put(ApiEndpoint endpoint, {Object? data}) async {
    final url = endpoint.baseUrl + endpoint.path;
    return _dio.put(url, queryParameters: endpoint.queryParameters, data: data);
  }

  Future<Response> delete(ApiEndpoint endpoint) async {
    final url = endpoint.baseUrl + endpoint.path;
    return _dio.delete(url, queryParameters: endpoint.queryParameters);
  }
}
