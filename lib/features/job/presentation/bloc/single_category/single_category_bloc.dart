import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/features/job/data/models/category_model.dart';
import 'package:handyman/features/job/data/models/job_model.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_service.dart';

part 'single_category_event.dart';
part 'single_category_state.dart';
part 'single_category_bloc.freezed.dart';

class SingleCategoryBloc
    extends Bloc<SingleCategoryEvent, SingleCategoryState> {
  SingleCategoryBloc() : super(const SingleCategoryStateInitial()) {
    on<_SingleCategoryEventGet>((event, emit) async {
      String id = event.id;
      final ApiService request = ApiService();
      final String baseUrl = AppConstants.baseUrl;
      emit(const SingleCategoryState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, "${ApiList.categories}/listings/$id", {}),
        );
        if (response.statusCode == 200) {
          final List jobResponseData = response.data["data"];

          final List<JobModel> jobs = jobResponseData.map(
            (e) {
              return JobModel.fromJson(e);
            },
          ).toList();
          emit(SingleCategoryState.loaded(jobs: jobs));
        } else {
          emit(const SingleCategoryState.error());
        }
      }
    });
  }
}
