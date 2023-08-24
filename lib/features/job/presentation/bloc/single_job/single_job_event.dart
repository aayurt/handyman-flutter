part of 'single_job_bloc.dart';

@freezed
class SingleJobEvent with _$SingleJobEvent {
  const factory SingleJobEvent.get({required String id}) = _SingleJobEventGet;
}
