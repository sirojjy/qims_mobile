import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<OnDashboardEvent>(_validateToDashboard);
  }

  FutureOr<void> _validateToDashboard(OnDashboardEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(
        state.copyWith(
            status: DashboardStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.klien);
      var request = await http.post(
        url,
        body: {
          'id_klien' : prefs.getString('id_klien'),
        }
      );


      var response = jsonDecode(request.body);
      print('print ${response['profil'][0]['nama_klien']}');
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
            nama_klien: response['profil'][0]['nama_klien'],
            alamat: response['profil'][0]['alamat'],


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
