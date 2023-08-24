part of 'single_application_bloc.dart';

@freezed
class SingleApplicationState with _$SingleApplicationState {
  const factory SingleApplicationState.initial() =
      SingleApplicationStateInitial;
  const factory SingleApplicationState.loading() =
      SingleApplicationStateLoading;
  const factory SingleApplicationState.loaded(
      {required ApplicationModel application}) = SingleApplicationStateLoaded;
  const factory SingleApplicationState.error() = SingleApplicationStateError;
}
