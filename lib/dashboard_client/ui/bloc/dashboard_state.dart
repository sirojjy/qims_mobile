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
    this.nama_cp,
    this.no_hp,
    this.email,

    this.no_reg,
    this.nama_iso,
    this.scope,
    this.tgl_expire,
    this.tgl_asses,
    this.sert,

    this.maps,
    this.tgl_sert_awal,

    this.jml_sertifikat,
    this.telah_dijadwalkan,
    this.dijadwalkan,
    this.selesai,
    this.tglAsses,

  });

  final DashboardStateStatus? status;
  final String? id_klien;
  final String? id_users;
  final String? message;
  //profil
  final String? nama_klien;
  final String? alamat;
  final String? nama_cp;
  final String? no_hp;
  final String? email;

  final String? no_reg;
  final String? nama_iso;
  final String? scope;
  final String? tgl_expire;
  final String? tgl_asses;
  final String? sert;

  final String? maps;
  final String? tgl_sert_awal;

  final String? jml_sertifikat;
  final String? telah_dijadwalkan;
  final String? dijadwalkan;
  final String? selesai;
  final String? tglAsses;

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    id_klien,
    id_users,
    message,
    nama_klien,
    alamat,
    nama_cp,
    no_hp,
    email,

    no_reg,
    nama_iso,
    scope,
    tgl_expire,
    tgl_asses,
    sert,

    maps,
    tgl_sert_awal,

    jml_sertifikat,
    telah_dijadwalkan,
    dijadwalkan,
    selesai,
    tglAsses,

  ];

  DashboardState copyWith({
    DashboardStateStatus? status,
    String? id_klien,
    String? id_users,
    String? message,
    //profil
    String? nama_klien,
    String? alamat,
    String? nama_cp,
    String? no_hp,
    String? email,

    String? no_reg,
    String? nama_iso,
    String? scope,
    String? tgl_expire,
    String? tgl_asses,
    String? sert,

    String? maps,
    String? tgl_sert_awal,

    String? jml_sertifikat,
    String? telah_dijadwalkan,
    String? dijadwalkan,
    String? selesai,
    String? tglAsses,
  }) {
    return DashboardState(
      status: status ?? this.status,
      id_klien: id_klien ?? this.id_klien,
      id_users: id_users ?? this.id_users,
      message: message ?? this.message,
      //profil
      nama_klien: nama_klien ?? this.nama_klien,
      alamat: alamat ?? this.alamat,
      nama_cp: nama_cp ?? this.nama_cp,
      no_hp: no_hp ?? this.no_hp,
      email: email ?? this.email,

      no_reg: no_reg ?? this.no_reg,
      nama_iso: nama_iso ?? this.nama_iso,
      scope: scope ?? this.scope,
      tgl_expire: tgl_expire ?? this.tgl_expire,
      tgl_asses: tgl_asses ?? this.tgl_asses,
      sert: sert ?? this.sert,

      maps: maps ?? this.maps,
      tgl_sert_awal: tgl_sert_awal ?? this.tgl_sert_awal,

      telah_dijadwalkan: telah_dijadwalkan ?? this.telah_dijadwalkan,
      dijadwalkan: dijadwalkan ?? this.dijadwalkan,
      selesai: selesai ?? this.selesai,
      jml_sertifikat: jml_sertifikat ?? this.jml_sertifikat,
      tglAsses: tglAsses ?? this.tglAsses,
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
