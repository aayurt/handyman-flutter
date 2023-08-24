part of 'single_application_bloc.dart';

@freezed
class SingleApplicationEvent with _$SingleApplicationEvent {
  const factory SingleApplicationEvent.get({required String id}) =
      _SingleApplicationEventGet;
}
