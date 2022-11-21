part of 'dashboard_bloc.dart';

enum DashboardStateStatus {initial, success, error, loading}

extension DashboardInitial on DashboardStateStatus {
  bool get isInitial => this == DashboardStateStatus.initial;
  bool get success => this == DashboardStateStatus.success;
  bool get error => this == DashboardStateStatus.error;
  bool get loading => this == DashboardStateStatus.loading;

}

class DashboardState extends Equatable{
  const DashboardState({
    this.status = DashboardStateStatus.initial,
    this.id_klien,
    this.id_users,
    this.message,
    //rencana audit
    this.rencana_audit,
    this.nama_iso,
    this.dok_file,
    this.detail_file,
    this.nama_klien,

});

  final DashboardStateStatus? status;
  final String? id_klien;
  final String? id_users;
  final String? message;
  final String? rencana_audit;
  final String? nama_iso;
  final String? dok_file;
  final String? detail_file;
  final String? nama_klien;

  @override
  // TODO: implement props
  List<Object?> get props => [
    status, id_klien, id_users,message,
    rencana_audit, nama_iso, nama_klien, dok_file, detail_file,
  ];

  DashboardState copyWith ({
    DashboardStateStatus? status,
    String? id_klien,
    String? id_users,
    String? message,
    String? rencana_audit,
    String? nama_iso,
    String? nama_klien,
    String? dok_file,
    String? detail_file,

}) {
    return DashboardState(
      status: status ?? this.status,
      id_klien: id_klien ?? this.id_klien,
      id_users: id_users ?? this.id_users,
      message: message ?? this.message,
      rencana_audit: rencana_audit ?? this.rencana_audit,
      nama_iso: nama_iso ?? this.nama_iso,
      nama_klien: nama_klien ?? this.nama_klien,
      dok_file: dok_file ?? this.dok_file,
      detail_file: detail_file ?? this.detail_file,
    );
  }
}
