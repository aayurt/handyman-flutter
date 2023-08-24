part of 'filter_job_bloc.dart';

@freezed
class FilterJobState with _$FilterJobState {
  const factory FilterJobState.initial() = FilterJobStateInitial;
  const factory FilterJobState.loading() = FilterJobStateLoading;
  const factory FilterJobState.loaded({required List<JobModel> jobs}) =
      FilterJobStateLoaded;
  const factory FilterJobState.error() = FilterJobStateError;
}
