import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/features/order/data/models/application_model.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_service.dart';

part 'single_application_event.dart';
part 'single_application_state.dart';
part 'single_application_bloc.freezed.dart';

class SingleApplicationBloc
    extends Bloc<SingleApplicationEvent, SingleApplicationState> {
  SingleApplicationBloc() : super(const SingleApplicationStateInitial()) {
    on<_SingleApplicationEventGet>((event, emit) async {
      String id = event.id;
      final ApiService request = ApiService();
      final String baseUrl = AppConstants.baseUrl;
      emit(const SingleApplicationState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, "${ApiList.applicationApp}/$id", {}),
        );
        if (response.statusCode == 200) {
          final ApplicationModel application =
              ApplicationModel.fromJson(response.data["data"]);
          emit(SingleApplicationState.loaded(application: application));
        } else {
          emit(const SingleApplicationState.error());
        }
      }
    });
  }
}
