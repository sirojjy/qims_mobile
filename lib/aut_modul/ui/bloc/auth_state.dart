part of 'auth_bloc.dart';

enum AuthStateStatus {initial, success, error, loading}

extension AuthStateStatusX on AuthStateStatus {
  bool get isInitial => this == AuthStateStatus.initial;
  bool get isSuccess => this == AuthStateStatus.success;
  bool get isError => this == AuthStateStatus.error;
  bool get isLoading => this == AuthStateStatus.loading;
}




class AuthState extends Equatable {

  const AuthState({
    this.username,
    this.password,
    this.status = AuthStateStatus.initial,
    this.message
});

  final String? username;
  final String? password;
  final AuthStateStatus status;
  final String? message;

  @override
  // TODO: implement props
  List<Object?> get props => [
    username,
    password,
    status,
    message,
  ];

  AuthState copyWith ({
    String? username,
    String? password,
    AuthStateStatus? status,
    String? message
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

}
