part of 'filter_job_bloc.dart';

@freezed
class FilterJobEvent with _$FilterJobEvent {
  const factory FilterJobEvent.get({required String search}) =
      _FilterJobEventGet;
}
