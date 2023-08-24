part of 'single_job_bloc.dart';

@freezed
class SingleJobState with _$SingleJobState {
  const factory SingleJobState.initial() = SingleJobStateInitial;
  const factory SingleJobState.loading() = SingleJobStateLoading;
  const factory SingleJobState.loaded({required JobModel job}) =
      SingleJobStateLoaded;
  const factory SingleJobState.error() = SingleJobStateError;
}
