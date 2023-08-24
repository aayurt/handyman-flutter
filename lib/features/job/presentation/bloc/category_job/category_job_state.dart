part of 'category_job_bloc.dart';

@freezed
class CategoryJobState with _$CategoryJobState {
  const factory CategoryJobState.initial() = CategoryJobStateInitial;
  const factory CategoryJobState.loading() = CategoryJobStateLoading;
  const factory CategoryJobState.loaded(
      {required List<CategoryModel> categories}) = CategoryJobStateLoaded;
  const factory CategoryJobState.error() = CategoryJobStateError;
}
