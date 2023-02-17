part of 'post_audit_bloc.dart';

enum PostAuditStateStatus { initial, success, error, loading }

extension PostAuditInitial on PostAuditStateStatus {
  bool get isInitial => this == PostAuditStateStatus.initial;
  bool get success => this == PostAuditStateStatus.success;
  bool get error => this == PostAuditStateStatus.error;
  bool get loading => this == PostAuditStateStatus.loading;
}

class PostAuditState extends Equatable {
  final PostAuditStateStatus status;
  final String? message;
  final List<SertifikatModel> dataSertifikat;

  PostAuditState({
    this.status = PostAuditStateStatus.initial,
    this.message,
    required this.dataSertifikat
  });

  @override
  List<Object?> get props => [
    status,
    message,
    dataSertifikat
  ];

  PostAuditState copyWith({
    PostAuditStateStatus? status,
    String? message,
    List<SertifikatModel>? dataSertifikat,
}) {
    return PostAuditState(
      status: status?? this.status,
      message: message?? this.message,
      dataSertifikat: dataSertifikat ?? this.dataSertifikat,
    );
  }
}
