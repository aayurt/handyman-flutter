import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/features/job/data/models/job_model.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_service.dart';

part 'single_job_event.dart';
part 'single_job_state.dart';
part 'single_job_bloc.freezed.dart';

class SingleJobBloc extends Bloc<SingleJobEvent, SingleJobState> {
  SingleJobBloc() : super(const SingleJobStateInitial()) {
    on<_SingleJobEventGet>((event, emit) async {
      String id = event.id;
      final ApiService request = ApiService();
      final String baseUrl = AppConstants.baseUrl;
      emit(const SingleJobState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, "${ApiList.listing}/$id", {}),
        );
        if (response.statusCode == 200) {
          final JobModel job = JobModel.fromJson(response.data["data"]);
          emit(SingleJobState.loaded(job: job));
        } else {
          emit(const SingleJobState.error());
        }
      }
    });
  }
}
