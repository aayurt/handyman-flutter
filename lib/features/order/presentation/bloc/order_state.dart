part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = OrderStateInitial;
  const factory OrderState.loading() = OrderStateLoading;
  const factory OrderState.loaded(
      {required List<ApplicationModel> applications}) = OrderStateLoaded;
  const factory OrderState.error() = OrderStateError;
}
