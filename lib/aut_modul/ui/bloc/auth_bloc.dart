import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';




class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<OnLoginEvent>(_validateToLogin);
  }

  

  FutureOr<void> _validateToLogin(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        status: AuthStateStatus.loading
      )
    );

    try{
      if(event.username == '' && event.password == ''){
        emit(
          state.copyWith(
            status: AuthStateStatus.error,
            message: 'Username dan Password tidak boleh kosong',
          )
        );
      } else if(event.username == ''){
        emit(
          state.copyWith(
            status: AuthStateStatus.error,
            message: 'Username tidak boleh kosong',
          )
        );
      } else if(event.password == ''){
        emit(
          state.copyWith(
            status: AuthStateStatus.error,
            message: 'Password tidak boleh kosong',
          )
        );
      } else{
        var url = Uri.parse(ApiConstant.authentication);
        var request = await http.post(
            url,
            body: {
              'param' : event.param,
              'username' : event.username,
              'password' : event.password,
            }
        );
        var response = jsonDecode(request.body);
        if(response['status'] == 'fail'){
          emit(
              state.copyWith(
                message: response['error_msg'],
                status: AuthStateStatus.error,
              )
          );
        } else {
          emit(
              state.copyWith(
                status: AuthStateStatus.success,
              )
          );
        }
      }
    } catch(error, stacktrace){
      emit(
        state.copyWith(
          status: AuthStateStatus.error
        )
      );
    }
  }
}
