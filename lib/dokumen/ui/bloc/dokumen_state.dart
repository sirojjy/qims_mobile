part of 'dokumen_bloc.dart';

enum DokumenStateStatus { initial, success, error, loading}

extension DokumenInitial on DokumenStateStatus {
  bool get isInitial => this == DokumenStateStatus.initial;
  bool get success => this == DokumenStateStatus.success;
  bool get error => this == DokumenStateStatus.error;
  bool get loading => this == DokumenStateStatus.loading;
}

class DokumenState extends Equatable {
  final DokumenStateStatus status;
  final String? message;
  final List<DokumenModel> data;
  final bool? isSucess;

  DokumenState({
    this.status = DokumenStateStatus.initial,
    this.message,
    required this.data,
    this.isSucess
  });

  @override
  List<Object?> get props => [
    status,
    message,
    data,
    isSucess
  ];

  DokumenState copyWith({
     DokumenStateStatus? status,
     String? message,
    List<DokumenModel>? data,
    bool? isSucess
  }){
      return DokumenState(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        isSucess: isSucess ?? this.isSucess
      );
  }


}

