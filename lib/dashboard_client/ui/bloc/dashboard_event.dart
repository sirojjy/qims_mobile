part of 'dashboard_bloc.dart';

class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnDashboardEvent extends DashboardEvent {

}
class OnNotificationEvent extends DashboardEvent {
 final String? tglAsses;
 OnNotificationEvent(this.tglAsses);
 @override
  List<Object?> get props => [tglAsses];
}