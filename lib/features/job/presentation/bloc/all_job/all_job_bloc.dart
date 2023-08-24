import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/job/data/models/job_model.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_list.dart';
import '../../../../../core/network/api_service.dart';

part 'all_job_event.dart';
part 'all_job_state.dart';
part 'all_job_bloc.freezed.dart';

class AllJobBloc extends Bloc<AllJobEvent, AllJobState> {
  AllJobBloc() : super(const AllJobStateInitial()) {
    on<AllJobEventGet>((event, emit) async {
      final ApiService request = ApiService();

      final String baseUrl = AppConstants.baseUrl;
      emit(const AllJobState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, ApiList.listing, {}),
        );
        if (response.statusCode == 200) {
          final List jobResponseData = response.data["data"];
          if (jobResponseData.isNotEmpty) {
            final List<JobModel> jobs = jobResponseData.map(
              (e) {
                return JobModel.fromJson(e);
              },
            ).toList();
            emit(AllJobState.loaded(jobs: jobs));
          }
        } else {
          emit(const AllJobState.error());
        }
      }
    });
  }
}
