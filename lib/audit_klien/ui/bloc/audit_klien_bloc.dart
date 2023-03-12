import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qims_mobile/audit_klien/ui/screen/audit_klien.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/model_audit.dart';

part 'audit_klien_event.dart';
part 'audit_klien_state.dart';

class AuditKlienBloc extends Bloc<AuditKlienEvent, AuditKlienState> {
  AuditKlienBloc() : super(AuditKlienState(
      dataDaftarHadir:[],
    dataOpeningClosing: [],
    dataNcr: [],
    dataStage2: [],
  )) {
    on<OnViewDaftarhadir>(_viewDaftarHadir);
    on<OnViewOpeningClosing>(_viewOpeningClosing);
    on<OnViewNcr>(_viewNcr);
    on<OnViewStage2>(_viewStage2);
  }

  FutureOr<void> _viewDaftarHadir(OnViewDaftarhadir event, Emitter<AuditKlienState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataDaftarHadir = <DaftarHadirModel>[];
    emit(
      state.copyWith(
        status: AuditKlienStateStatus.loading
      )
    );
    
    try{
      var url = Uri.parse(ApiConstant.viewDaftarHadir);
      var request = await http.post(
        url,
        body: {
          'id_klien' : prefs.getString('id_klien'),
          'level' :prefs.getString('level'),
        }
      );

      var response = jsonDecode(request.body);
      for(int i=0; i<response.length; i++){
        dataDaftarHadir.add(DaftarHadirModel(
          namaKlien: response[i]['nama_klien'],
          namaIso: response[i]['nama_iso'],
          tglAudit: response[i]['tanggal'],
          idDaftarHadir: response[i]['id_daftar_hadir'],
          idDetailDok: response[i]['id_detail_dok'],
          fileDaftarHadir: 'http://123.100.226.123:3010/file_uploads/daftar_hadir/${response[i]['dok_file']}'
        ));
      }
      emit(
        state.copyWith(
          status: AuditKlienStateStatus.success,
          dataDaftarHadir: dataDaftarHadir,
        )
      );
    } catch (error) {
      print('Error : $error');
      emit(state.copyWith(
        status: AuditKlienStateStatus.error,
      ));
    }
  }

  FutureOr<void> _viewOpeningClosing(OnViewOpeningClosing event, Emitter<AuditKlienState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataOpeningClosing = <OpeningClosingModel>[];
    emit(
        state.copyWith(
            status: AuditKlienStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.viewOpeningClosing);
      var request = await http.post(
          url,
          body: {
            'id_klien' : prefs.getString('id_klien'),
            'level' :prefs.getString('level'),
          }
      );

      var response = jsonDecode(request.body);
      for(int i=0; i<response.length; i++){
        dataOpeningClosing.add(OpeningClosingModel(
            namaKlien: response[i]['nama_klien'],
            namaIso: response[i]['nama_iso'],
            tglAudit: response[i]['tanggal'],
            idOpeningClosing: response[i]['id_daftar_hadir'],
            idDetailDok: response[i]['id_detail_dok'],
            fileOpeningClosing: 'http://123.100.226.123:3010/file_uploads/opening_closing/${response[i]['dok_file']}'
        ));
      }
      emit(
          state.copyWith(
            status: AuditKlienStateStatus.success,
            dataOpeningClosing: dataOpeningClosing,
          )
      );
    } catch (error) {
      print('Error : $error');
      emit(state.copyWith(
        status: AuditKlienStateStatus.error,
      ));
    }
  }

  FutureOr<void> _viewNcr(OnViewNcr event, Emitter<AuditKlienState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataNcr = <NcrModel>[];
    emit(
        state.copyWith(
            status: AuditKlienStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.viewNcr);
      var request = await http.post(
          url,
          body: {
            'id_klien' : prefs.getString('id_klien'),
            'level' :prefs.getString('level'),
          }
      );

      var response = jsonDecode(request.body);
      for(int i=0; i<response.length; i++){
        dataNcr.add(NcrModel(
            namaKlien: response[i]['nama_klien'],
            namaIso: response[i]['nama_iso'],
            tglNcr: response[i]['tanggal'],
            idNcr: response[i]['id_daftar_hadir'],
            idDetailDok: response[i]['id_detail_dok'],
            fileNcr: 'http://123.100.226.123:3010/file_uploads/ncr/${response[i]['dok_file']}'
        ));
      }
      emit(
          state.copyWith(
            status: AuditKlienStateStatus.success,
            dataNcr: dataNcr,
          )
      );
    } catch (error) {
      print('Error : $error');
      emit(state.copyWith(
        status: AuditKlienStateStatus.error,
      ));
    }
  }

  FutureOr<void> _viewStage2(OnViewStage2 event, Emitter<AuditKlienState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataStage2 = <Stage2Model>[];
    emit(
        state.copyWith(
            status: AuditKlienStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.viewStage2);
      var request = await http.post(
          url,
          body: {
            'id_klien' : prefs.getString('id_klien'),
            'level' :prefs.getString('level'),
          }
      );

      var response = jsonDecode(request.body);
      for(int i=0; i<response.length; i++){
        dataStage2.add(Stage2Model(
            namaKlien: response[i]['nama_klien'],
            namaIso: response[i]['nama_iso'],
            tglStage2: response[i]['tanggal'],
            idStage2: response[i]['id_laporan'],
            idDetailDok: response[i]['id_detail_dok'],
            fileStage2: 'http://123.100.226.123:3010/file_uploads/laporan/${response[i]['dok_file']}'
        ));
      }
      emit(
          state.copyWith(
            status: AuditKlienStateStatus.success,
            dataStage2: dataStage2,
          )
      );
    } catch (error) {
      print('Error : $error');
      emit(state.copyWith(
        status: AuditKlienStateStatus.error,
      ));
    }
  }
}
