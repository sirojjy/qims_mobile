part of 'dashboard_bloc.dart';

class DashboardEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class OnDashboardEvent extends DashboardEvent {
  final String? status;
  final String? id_klien;
  final String? id_users;
  final String? message;
  final String? rencana_audit;
  final String? nama_iso;
  final String? dok_file;
  final String? detail_file;
  final String? nama_klien;

  OnDashboardEvent(this.status, this.id_klien, this.id_users, this.rencana_audit, this.nama_iso, this.dok_file, this.detail_file, this.nama_klien, this.message);
}
