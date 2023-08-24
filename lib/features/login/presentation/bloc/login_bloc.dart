import 'package:bloc/bloc.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../domain/usecases/auth.usecase.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:flutter/foundation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitialState()) {
    // ignore: void_checks
    on<LoginEvent>((event, emit) async {
      final param = event.param;
      emit(const LoginState.loading());
      var result = await serviceLocator<LoginUserUsecase>().loginUser(param);
      result.fold(
        (failure) {
          if (kDebugMode) {
            print("Response->ERROR");
            print(failure.message);
          }
          emit(LoginState.error(failure.message));
        },
        (data) {
          if (kDebugMode) {
            print("Response->SUCCESS");
            print(data);
          }
          emit(LoginState.loaded(user: data));
        },
      );
    });
  }
}
