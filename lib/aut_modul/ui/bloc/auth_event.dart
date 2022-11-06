part of 'auth_bloc.dart';


class AuthEvent extends Equatable{
  @override
  List<Object?> get props =>[];
}

class OnLoginEvent extends AuthEvent {
  final String? param;
  final String? username;
  final String? nama;
  final String? password;

  OnLoginEvent( {this.param, this.username, this.password, this.nama});

  @override
  List<Object?> get props => [param, username, password];
}

class OnRegisterEvent extends AuthEvent {
  final String? param;
  final String? username;
  final String? nama;
  final String? password;

  OnRegisterEvent( {this.param, this.username, this.password, this.nama});

  @override
  List<Object?> get props => [param, username, password, nama];
}
