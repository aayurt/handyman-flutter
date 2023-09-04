part of 'single_category_bloc.dart';

@freezed
class SingleCategoryEvent with _$SingleCategoryEvent {
  const factory SingleCategoryEvent.get({required String id}) =
      _SingleCategoryEventGet;
}
