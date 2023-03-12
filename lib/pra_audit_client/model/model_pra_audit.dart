class PraAuditModel {
  final String? namaKlien;
  final String? nomorSurat;
  final String? tanggal;
  final String? dokFile;
  final String? namaIso;

  PraAuditModel({
    this.namaKlien,
    this.nomorSurat,
    this.tanggal,
    this.dokFile,
    this.namaIso,
  });
}

class JadwalAuditModel{
  final String? jenisAudit;
  final String? tanggalJadwal;
  final String? namaIso;
  final String? status;
  final String? namaKlien;

  JadwalAuditModel({
    this.jenisAudit,
    this.tanggalJadwal,
    this.namaIso,
    this.status,
    this.namaKlien,
  });
}

class SuratTugasModel {
  final String? namaKlien;
  final String? tanggalSurat;
  final String? noSurat;
  final String? namaIso;
  final String? fileSurat;

  SuratTugasModel({
    this.namaKlien,
    this.tanggalSurat,
    this.noSurat,
    this.namaIso,
    this.fileSurat
  });
}