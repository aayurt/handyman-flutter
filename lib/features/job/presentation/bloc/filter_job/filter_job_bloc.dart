import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_list.dart';
import '../../../../../core/network/api_service.dart';
import '../../../data/models/job_model.dart';

part 'filter_job_event.dart';
part 'filter_job_state.dart';
part 'filter_job_bloc.freezed.dart';

class FilterJobBloc extends Bloc<FilterJobEvent, FilterJobState> {
  FilterJobBloc() : super(const FilterJobStateInitial()) {
    on<_FilterJobEventGet>((event, emit) async {
      final search = event.search;
      final ApiService request = ApiService();

      final String baseUrl = AppConstants.baseUrl;
      emit(const FilterJobState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, "${ApiList.listing}/search/$search", {}),
        );
        if (response.statusCode == 200) {
          final List jobResponseData = response.data["data"];
          if (jobResponseData.isNotEmpty) {
            final List<JobModel> jobs = jobResponseData.map(
              (e) {
                return JobModel.fromJson(e);
              },
            ).toList();
            emit(FilterJobState.loaded(jobs: jobs));
          }
        } else {
          emit(const FilterJobState.error());
        }
      }
    });
  }
}
