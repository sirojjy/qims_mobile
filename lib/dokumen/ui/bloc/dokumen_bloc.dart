import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qims_mobile/dashboard_client/ui/bloc/dashboard_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:qims_mobile/dokumen/model/dokumen_model.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dokumen_event.dart';
part 'dokumen_state.dart';

class DokumenBloc extends Bloc<DokumenEvent, DokumenState> {
  DokumenBloc() : super(DokumenState(data: [])) {
    on<DokumenEvent>(_validateToDokumen);
  }

  FutureOr<void> _validateToDokumen(DokumenEvent event, Emitter<DokumenState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = <DokumenModel>[];
    emit(
      state.copyWith(
        status: DokumenStateStatus.loading
      )
    );

    try{
      var url = Uri.parse(ApiConstant.viewDokCenter);
      var request = await http.post(
          url,
          body: {
            'id_klien' : prefs.getString('id_klien'),
          }
      );

      var response = jsonDecode(request.body);
      //   print('NDENE RA SIH? 2');
        for(int i=0; i<response.length; i++){
          data.add(DokumenModel(
            namaDokumen: response[i]['nama_dok'],
            jenisDok: response[i]['jenis_dok'] == '0' ? 'Manual' : response[i]['jenis_dok'] == '1' ? 'Prosedur' : 'Lainya',
            fileDok: 'http://123.100.226.123:3010/file_uploads/dok_center/${response[i]['file_dok']}'
          ));
        }


        //CEK Perulangan
        // for(int i=0; i<data.length; i++){
          // print('HALOO : ${data[i].namaDokumen}');
          //CEK FileDok
          // print('URL : ${data[i].fileDok}');
        // }
        emit(
          state.copyWith(
            status: DokumenStateStatus.success,
            data: data
          )
        );
      // }
    } catch (error) {
      // print('NDENE RA SIH? 3$error}');
      emit(
        state.copyWith(
          status: DokumenStateStatus.error,
          data: data
        )
      );
    }
  }

  FutureOr<void> _validateAddDokumen(DokumenEvent event, Emitter<DokumenState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
