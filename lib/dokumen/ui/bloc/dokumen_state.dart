part of 'dokumen_bloc.dart';

enum DokumenStateStatus { initial, success, error, loading}

extension DokumenInitial on DokumenStateStatus {
  bool get isInitial => this == DokumenStateStatus.initial;
  bool get success => this == DokumenStateStatus.success;
  bool get error => this == DokumenStateStatus.error;
  bool get loading => this == DokumenStateStatus.loading;
}

class DokumenState extends Equatable {


  DokumenState({
    this.status = DokumenStateStatus.initial,
    this.message,
    required this.data
});
  final DokumenStateStatus? status;
  final String? message;
  final List<DokumenModel> data;


  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    data
  ];

  DokumenState copyWith({
     DokumenStateStatus? status,
     String? message,
    List<DokumenModel>? data
}){
    return DokumenState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data
    );
}


}

