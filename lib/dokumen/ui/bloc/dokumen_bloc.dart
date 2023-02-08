import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:qims_mobile/dokumen/model/dokumen_model.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dokumen_event.dart';
part 'dokumen_state.dart';

class DokumenBloc extends Bloc<DokumenEvent, DokumenState> {
  DokumenBloc() : super(DokumenState(data: [])) {
    on<OnDokumenView>(_validateToDokumen);
    on<OnDokumenTambah>(_validateAddDokumen);
    on<OnDokumenResetStatus>((event, emit) {
      print('NYAMPAI SINI');
      emit(state.copyWith(isSucess: null, message: null));
    });
  }

  ///BLOC View Data
  FutureOr<void> _validateToDokumen(OnDokumenView event, Emitter<DokumenState> emit) async{
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

        ///CEK Perulangan
        // for(int i=0; i<data.length; i++){
          // print('HALOO : ${data[i].namaDokumen}');
          ///CEK FileDok
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

  ///BLOC Tambah Data
  FutureOr<void> _validateAddDokumen(OnDokumenTambah event, Emitter<DokumenState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(event.nama_dok == null || event.nama_dok == '') {
      print('KONDISI 1');
      emit (state.copyWith(message: 'Mohon isi form dengan benar'));
      ///reset status message
    }else{
      print('KONDISI 2');
      ///handle file
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(ApiConstant.actDokCenter));

      request.fields['id_klien'] = '${prefs.getString('id_klien')}';
      request.fields['nama_dok'] = '${event.nama_dok}';
      request.fields['jenis_dok'] = '${event.jenis_dok}';

      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          'file', '${event.file?.path}');

      request.files.add(multipartFile);

      http.StreamedResponse response = await request.send();
      //     http.MultipartFile.fro(
      //     'file',
      //     event.file,
      //     contentType: new MediaType('image', 'jpeg')
      // ))

      // var response = await request.send();
      // var responsed = await http.Response.fromStream(response);
      // final responseData = jsonDecode(response.);
      if (response.statusCode==200) {
        print('Sukses');
        emit(
            state.copyWith(
              isSucess: true,
            )
        );
      }
      else {
        print('Gagal');
        emit(
            state.copyWith(
              isSucess: false,
            )
        );
      }
    }


      //
      // try {
      //   if(event.nama_dok == '' && event.jenis_dok == '' && event.file == ''){
      //     state.copyWith(
      //       status: DokumenStateStatus.error,
      //       message: 'Silahkan isi data terlebih dahulu',
      //     );
      //   } else {
      //     var url = Uri.parse(ApiConstant.actDokCenter);
      //     var request = await http.post(
      //       url,
      //       body: {
      //         'nama_dok' : event.nama_dok,
      //         'jenis_dok' : event.jenis_dok,
      //         'file' : event.file,
      //       }
      //     );
      //
      //     ///respon
      //     var response = jsonDecode(request.body);
      //     print('INI HASILNYA : $response');
      //     if(response['status'] == 'gagal' ){
      //       emit(
      //         state.copyWith(
      //           message: response['error_msg'],
      //           status: DokumenStateStatus.error,
      //         )
      //       );
      //     } else {
      //       emit(
      //         state.copyWith(
      //           status: DokumenStateStatus.success,
      //         )
      //       );
      //     }
      //   }
      // } catch(error, stacktrace){
      //   emit(
      //     state.copyWith(
      //       status: DokumenStateStatus.error
      //     )
      //   );
      // }
  }
}
