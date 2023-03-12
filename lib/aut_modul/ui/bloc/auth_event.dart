part of 'auth_bloc.dart';


class AuthEvent extends Equatable{
  @override
  List<Object?> get props =>[];
}

class OnLoginEvent extends AuthEvent {
  final String? param;
  final String? username;
  final String? password;


  OnLoginEvent({this.param, this.username, this.password});

  @override
  List<Object?> get props => [param, username, password];
}

class OnRegisterEvent extends AuthEvent {
  final String? param;
  final String? username;
  final String? password;
  final String? nama_klien;
  final String? alamat;
  final String? nama_cp;
  final String? email;

  OnRegisterEvent({this.param, this.username, this.password, this.nama_klien, this.alamat, this.nama_cp, this.email,});

  @override
  List<Object?> get props => [param, username, password];
}
