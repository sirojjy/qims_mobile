part of 'auth_bloc.dart';

enum AuthStateStatus {initial, success, error, loading, successRegister}

extension AuthStateStatusX on AuthStateStatus {
  bool get isInitial => this == AuthStateStatus.initial;
  bool get isSuccess => this == AuthStateStatus.success;
  bool get isError => this == AuthStateStatus.error;
  bool get isLoading => this == AuthStateStatus.loading;
  bool get isSuccessRegister => this == AuthStateStatus.successRegister;
}




class AuthState extends Equatable {

  const AuthState({
    this.nama_klien,
    this.alamat,
    this.nama_cp,
    this.email,
    this.username,
    this.password,
    this.status = AuthStateStatus.initial,
    this.message
});

  final String? username;
  final String? password;
  final AuthStateStatus status;
  final String? message;
  final String? nama_klien;
  final String? alamat;
  final String? nama_cp;
  final String? email;

  @override
  // TODO: implement props
  List<Object?> get props => [
    username,
    password,
    status,
    message,
    nama_klien,
    alamat,
    nama_cp,
    email,
  ];

  AuthState copyWith ({
    String? username,
    String? password,
    AuthStateStatus? status,
    String? message,
    String? nama_klien,
    String? alamat,
    String? nama_cp,
    String? email,
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
      nama_klien: nama_klien ?? this.nama_klien,
      alamat: alamat ?? this.alamat,
      nama_cp: nama_cp ?? this.nama_cp,
      email: email ?? this.email,
    );
  }

}
