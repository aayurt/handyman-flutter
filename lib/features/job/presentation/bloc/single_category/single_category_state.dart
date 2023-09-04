part of 'single_category_bloc.dart';

@freezed
class SingleCategoryState with _$SingleCategoryState {
  const factory SingleCategoryState.initial() = SingleCategoryStateInitial;
  const factory SingleCategoryState.loading() = SingleCategoryStateLoading;
  const factory SingleCategoryState.loaded({required List<JobModel> jobs}) =
      SingleCategoryStateLoaded;
  const factory SingleCategoryState.error() = SingleCategoryStateError;
}
