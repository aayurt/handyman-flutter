import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/job/data/models/job_model.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_list.dart';
import '../../../../../core/network/api_service.dart';

part 'top_job_event.dart';
part 'top_job_state.dart';
part 'top_job_bloc.freezed.dart';

class TopJobBloc extends Bloc<TopJobEvent, TopJobState> {
  TopJobBloc() : super(const TopJobStateInitial()) {
    final ApiService request = ApiService();

    on<TopJobEventGet>((event, emit) async {
      final String baseUrl = AppConstants.baseUrl;
      emit(const TopJobState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, ApiList.job, {}),
          // data: param.toJson(),
        );
        if (response.statusCode == 200) {
          final List jobResponseData = response.data["data"];
          if (jobResponseData.isNotEmpty) {
            final List<JobModel> jobModelList = jobResponseData.map(
              (e) {
                return JobModel.fromJson(e);
              },
            ).toList();

            emit(TopJobState.loaded(jobs: jobModelList));
          }
        } else if (response.statusCode == 401) {
          emit(const TopJobState.error());
        }
      }
    });
  }
}
