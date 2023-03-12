part of 'audit_klien_bloc.dart';

enum AuditKlienStateStatus {initial, success, error, loading}

extension AuditKlienInitial on AuditKlienStateStatus {
  bool get isInitial => this == AuditKlienStateStatus.initial;
  bool get success => this == AuditKlienStateStatus.success;
  bool get error => this == AuditKlienStateStatus.error;
  bool get loading => this == AuditKlienStateStatus.loading;
}

class AuditKlienState extends Equatable{
  final AuditKlienStateStatus status;
  final String? message;
  final List<DaftarHadirModel> dataDaftarHadir;
  final List<OpeningClosingModel> dataOpeningClosing;
  final List<NcrModel> dataNcr;
  final List<Stage2Model> dataStage2;

  AuditKlienState({
    this.status = AuditKlienStateStatus.initial,
    this.message,
    required this.dataDaftarHadir,
    required this.dataOpeningClosing,
    required this.dataNcr,
    required this.dataStage2,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    dataDaftarHadir,
    dataOpeningClosing,
    dataNcr,
    dataStage2
  ];

  AuditKlienState copyWith({
    AuditKlienStateStatus? status,
    String? message,
    List<DaftarHadirModel>? dataDaftarHadir,
    List<OpeningClosingModel>? dataOpeningClosing,
    List<NcrModel>? dataNcr,
    List<Stage2Model>? dataStage2,
  }) {
    return AuditKlienState(
      status:  status ?? this.status,
      message: message ?? this.message,
      dataDaftarHadir: dataDaftarHadir ?? this.dataDaftarHadir,
      dataOpeningClosing: dataOpeningClosing ?? this.dataOpeningClosing,
      dataNcr: dataNcr ?? this.dataNcr,
      dataStage2: dataStage2 ?? this.dataStage2,
    );
  }
}



