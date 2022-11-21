import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<DashboardEvent>((event, emit) {
      on<OnDashboardEvent>(_validateToDashboard);
    });
  }

  FutureOr<void> _validateToDashboard(OnDashboardEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(
        state.copyWith(
            status: DashboardStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.authentication);
      var request = await http.post(
        url,
        body: {
          'status' : event.status,
          'id_klien' : event.id_klien,
        }
      );
      var response = jsonDecode(request.body);
      if(response['status'] == 'fail') {
        emit(
          state.copyWith(
            message:response['error_msg'],
            status: DashboardStateStatus.error,
          )
        );
      } else {
        emit(
          state.copyWith(
            status: DashboardStateStatus.success,

          )
        );
      }
    } catch(error, stacktrace) {
      emit(
        state.copyWith(
          status: DashboardStateStatus.error
        )
      );
    }
  }
}
