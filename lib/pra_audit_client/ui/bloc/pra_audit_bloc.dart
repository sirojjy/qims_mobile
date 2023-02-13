import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qims_mobile/pra_audit_client/model/model_pra_audit.dart';

part 'pra_audit_event.dart';
part 'pra_audit_state.dart';

class PraAuditBloc extends Bloc<PraAuditEvent, PraAuditState> {
  PraAuditBloc() : super(PraAuditState(
    data: [],
    dataJadwalAudit: [],
      dataSuratTugas: [],
  )) {
    on<OnPraAuditView>(_praAuditView);
    on<OnViewJadwalAudit>(_viewJadwalAudit);
    on<OnViewSuratTugas>(_viewSuratTugas);
  }

  ///View Jadwal Audit
  Future<void> _viewJadwalAudit(OnViewJadwalAudit event, Emitter<PraAuditState> emit) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataJadwalAudit = <JadwalAuditModel>[];
    emit(
        state.copyWith(
            status: PraAuditStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.viewJadwalAudit);
      // String level = '1';
      var request = await http.post(
          url,
          body: {
            'id_klien' : prefs.getString('id_klien'),
            'level' : prefs.getString('level')
          }
      );

      var response = jsonDecode(request.body);

      for(int i=0; i<response.length; i++){
        dataJadwalAudit.add(JadwalAuditModel(
            jenisAudit: response[i]['jenis_audit'],
            tanggalJadwal: response[i]['tanggal_jadwal'],
            namaIso: response[i]['nama_iso'],
            status: response[i]['status'],
            namaKlien: response[i]['nama_klien'],
        ));
      }
      ///test
      // print('LEVEL :${prefs.getString('level')}');
      // print('LEVEL :${prefs.getString('id_klien')}');
      // for(int i=0; i<dataJadwalAudit.length; i++){
      //   print('Jenis Audit : ${dataJadwalAudit[i].jenisAudit}');
      //   ///CEK FileDok
      //   print('URL : ${dataJadwalAudit[i].status}');
      // }

      emit(
          state.copyWith(
            status: PraAuditStateStatus.success,
            dataJadwalAudit: dataJadwalAudit,
          )
      );
    } catch (error){
      print('Jajal $error');
      emit(
          state.copyWith(
            status: PraAuditStateStatus.error,
          )
      );
    }
  }

  ///View Rencana Audit
  Future<void> _praAuditView(OnPraAuditView event, Emitter<PraAuditState> emit) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = <PraAuditModel>[];
    emit(
        state.copyWith(
            status: PraAuditStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.viewRencanaAudit);
      var request = await http.post(
          url,
          body: {
            'id_klien' : prefs.getString('id_klien'),
            'level' : prefs.getString('level')
          }
      );

      var response = jsonDecode(request.body);
      for(int i=0; i<response.length; i++){
        data.add(PraAuditModel(
            namaKlien: response[i]['nama_klien'],
            nomorSurat: response[i]['no_surat'],
            tanggal: response[i]['tanggal'],
            namaIso: response[i]['nama_iso'],
            dokFile:'http://123.100.226.123:3010/file_uploads/rencana_audit/${response[i]['dok_file']}'
        ));
      }
      // for(int i=0; i<data.length; i++){
      //   print('NO SURAT : ${data[i].nomorSurat}');
      //   ///CEK FileDok
      //   print('URL : ${data[i].dokFile}');
      // }
      emit(
          state.copyWith(
            status: PraAuditStateStatus.success,
            data: data,
          )
      );
    } catch (error){
      print('Jajal $error');
      emit(
        state.copyWith(
          status: PraAuditStateStatus.error,
        )
      );
    }
  }

  ///View Surat Tugas
  FutureOr<void> _viewSuratTugas(OnViewSuratTugas event, Emitter<PraAuditState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataSuratTugas = <SuratTugasModel>[];
    emit(
      state.copyWith(
        status: PraAuditStateStatus.loading
      )
    );

    try{
      var url = Uri.parse(ApiConstant.viewSuratTugas);
      var request = await http.post(
        url,
        body: {
          'id_klien' :prefs.getString('id_klien'),
          'level' : prefs.getString('level',)
        }
      );
      var response = jsonDecode(request.body);
      for(int i=0; i<response.length; i++){
        dataSuratTugas.add(SuratTugasModel(
          namaKlien: response[i]['nama_klien'],
          tanggalSurat: response[i]['tanggal'],
          noSurat: response[i]['no_surat'],
          namaIso: response[i]['nama_iso'],
          fileSurat: 'http://123.100.226.123:3010/file_uploads/surat_tugas/${response[i]['dok_file']}',
        ));
      }
      emit(
        state.copyWith(
          status: PraAuditStateStatus.success,
          dataSuratTugas: dataSuratTugas,
        )
      );
    } catch (error){
      emit(
        state.copyWith(
          status: PraAuditStateStatus.error,
        )
      );
    }
  }
}


