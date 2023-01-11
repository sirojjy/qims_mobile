part of 'dashboard_bloc.dart';

class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnDashboardEvent extends DashboardEvent {
  final String? status;
  final String? id_klien;
  final String? id_users;
  final String? message;
  final String? profil;
  final String? cor;
  final String? telah_dijadwalkan;
  final String? selesai;
  final String? jml_sertifikat;
  final String? ncr;
  final String? maps;
  final String? tgl_sert_awal;

  OnDashboardEvent(
    this.status,
    this.id_klien,
    this.id_users,
    this.message,
    this.profil,
    this.cor,
    this.telah_dijadwalkan,
    this.selesai,
    this.jml_sertifikat,
    this.ncr,
    this.maps,
    this.tgl_sert_awal,
  );
}
