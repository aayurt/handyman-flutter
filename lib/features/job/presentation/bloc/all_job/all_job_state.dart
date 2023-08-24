part of 'all_job_bloc.dart';

@freezed
class AllJobState with _$AllJobState {
  const factory AllJobState.initial() = AllJobStateInitial;
  const factory AllJobState.loading() = AllJobStateLoading;
  const factory AllJobState.loaded({required List<JobModel> jobs}) =
      AllJobStateLoaded;
  const factory AllJobState.error() = AllJobStateError;
}
