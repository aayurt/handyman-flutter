part of 'brand_job_bloc.dart';

@freezed
class BrandJobState with _$BrandJobState {
  const factory BrandJobState.initial() = BrandJobStateInitial;
  const factory BrandJobState.loading() = BrandJobStateLoading;
  const factory BrandJobState.loaded() = BrandJobStateLoaded;
  const factory BrandJobState.error() = BrandJobStateError;
}
