part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = DashboardInitialState;
  const factory DashboardState.loading() = DashboardLoadingState;
  const factory DashboardState.loaded() = DashboardLoadedState;
  const factory DashboardState.error() = DashboardErrorState;
}
