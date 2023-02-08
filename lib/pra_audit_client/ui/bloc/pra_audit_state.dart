part of 'pra_audit_bloc.dart';

enum PraAuditStateStatus {initial, success, error, loading}

extension PraAuditInitial on PraAuditStateStatus {
  bool get isInitial => this == PraAuditStateStatus.initial;
  bool get success => this == PraAuditStateStatus.success;
  bool get error => this == PraAuditStateStatus.error;
  bool get loading => this == PraAuditStateStatus.loading;
}

class PraAuditState extends Equatable {
  final PraAuditStateStatus status;
  final String? message;
  final List<PraAuditModel> data;

  PraAuditState({
    this.status = PraAuditStateStatus.initial,
    this.message,
    required this.data});

  @override
  List<Object?> get props => [
    status,
    message,
    data,
  ];

  PraAuditState copyWith({
    PraAuditStateStatus? status,
    String? message,
    List<PraAuditModel>? data,
}) {
    return PraAuditState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

}
