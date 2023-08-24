import 'package:get_it/get_it.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/features/login/domain/usecases/auth.usecase.dart';

import '../../features/login/data/datasources/login.datasource.dart';
import '../../features/login/data/repositories/login_user_repository.dart';
import '../../features/login/domain/repositories/login.repository.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // ! API Service
  serviceLocator.registerSingleton<ApiService>(ApiService());
  // ! Login Api
  //repo
  serviceLocator
      .registerFactory<LoginUserRepository>(() => LoginUserRepositoryImpl());
  //datasource
  serviceLocator.registerFactory<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());
  //usecase
  serviceLocator.registerFactory<LoginUserUsecase>(() => LoginUserUsecase());
}
