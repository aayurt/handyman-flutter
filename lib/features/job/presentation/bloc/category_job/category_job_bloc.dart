import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/job/data/models/category_model.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_list.dart';
import '../../../../../core/network/api_service.dart';

part 'category_job_event.dart';
part 'category_job_state.dart';
part 'category_job_bloc.freezed.dart';

class CategoryJobBloc extends Bloc<CategoryJobEvent, CategoryJobState> {
  CategoryJobBloc() : super(const CategoryJobStateInitial()) {
    on<_CategoryJobEventGet>((event, emit) async {
      final ApiService request = ApiService();

      final String baseUrl = AppConstants.baseUrl;
      emit(const CategoryJobState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, ApiList.categories, {}),
          // data: param.toJson(),
        );
        if (response.statusCode == 200) {
          final List categoryResponseData = response.data["data"];
          if (categoryResponseData.isNotEmpty) {
            final List<CategoryModel> categoryModelList =
                categoryResponseData.map(
              (e) {
                return CategoryModel.fromJson(e);
              },
            ).toList();

            emit(CategoryJobState.loaded(categories: categoryModelList));
          }
        } else if (response.statusCode == 401) {
          emit(const CategoryJobState.error());
        }
      }
    });
  }
}
