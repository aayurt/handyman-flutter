part of 'top_job_bloc.dart';

@freezed
class TopJobState with _$TopJobState {
  const factory TopJobState.initial() = TopJobStateInitial;
  const factory TopJobState.loading() = TopJobStateLoading;
  const factory TopJobState.loaded({required List<JobModel> jobs}) =
      TopJobStateLoaded;
  const factory TopJobState.error() = TopJobStateError;
}
