part of 'dashboard_bloc.dart';

enum DashboardStateStatus { initial, success, error, loading }

extension DashboardInitial on DashboardStateStatus {
  bool get isInitial => this == DashboardStateStatus.initial;
  bool get success => this == DashboardStateStatus.success;
  bool get error => this == DashboardStateStatus.error;
  bool get loading => this == DashboardStateStatus.loading;
}

class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStateStatus.initial,
    this.id_klien,
    this.id_users,
    this.message,
    //profil
    this.nama_klien,
    this.alamat,
    this.cor,
    this.telah_dijadwalkan,
    this.selesai,
    this.jml_sertifikat,
    this.ncr,
    this.maps,
    this.tgl_sert_awal,
  });

  final DashboardStateStatus? status;
  final String? id_klien;
  final String? id_users;
  final String? message;
  //profil
  final String? nama_klien;
  final String? alamat;
  final String? cor;
  final String? telah_dijadwalkan;
  final String? selesai;
  final String? jml_sertifikat;
  final String? ncr;
  final String? maps;
  final String? tgl_sert_awal;

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        id_klien,
        id_users,
        message,
        nama_klien,
        alamat,
        cor,
        telah_dijadwalkan,
        selesai,
        jml_sertifikat,
        ncr,
        maps,
        tgl_sert_awal,
      ];

  DashboardState copyWith({
    DashboardStateStatus? status,
    String? id_klien,
    String? id_users,
    String? message,
    //profil
    String? nama_klien,
    String? alamat,
    String? cor,
    String? telah_dijadwalkan,
    String? selesai,
    String? jml_sertifikat,
    String? ncr,
    String? maps,
    String? tgl_sert_awal,
  }) {
    return DashboardState(
      status: status ?? this.status,
      id_klien: id_klien ?? this.id_klien,
      id_users: id_users ?? this.id_users,
      message: message ?? this.message,
      //profil
      nama_klien: nama_klien ?? this.nama_klien,
      alamat: alamat ?? this.alamat,
      cor: cor ?? this.cor,
      telah_dijadwalkan: telah_dijadwalkan ?? this.telah_dijadwalkan,
      selesai: selesai ?? this.selesai,
      jml_sertifikat: jml_sertifikat ?? this.jml_sertifikat,
      ncr: ncr ?? this.ncr,
      maps: maps ?? this.maps,
      tgl_sert_awal: tgl_sert_awal ?? this.tgl_sert_awal,
    );
  }
}
// 'profil' => $this->M_dashboard->get_profil($id_klien),
// 'cor' => $this->M_dashboard->get_list_sertifikat($id_klien),
// 'telah_dijadwalkan' => $telah_dijadwalkan,
// 'selesai' => $selesai,
// 'dijadwalkan' => $dijadwalkan,
// 'jml_sertifikat' => $jml_sertifikat,
// 'ncr' => $this->M_dashboard->get_detail_ncr($id_klien),
// 'maps' => $row2->src_maps,
// 'tgl_sert_awal' => $this->M_dashboard->get_sert_awal($id_klien),
// 'id_klien' => $id_klien,
