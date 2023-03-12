import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/model_post_audit.dart';

part 'post_audit_event.dart';
part 'post_audit_state.dart';

class PostAuditBloc extends Bloc<PostAuditEvent, PostAuditState> {
  PostAuditBloc() : super(PostAuditState(
      dataSertifikat: []
  )) {
    on<OnViewSertifikat>(_viewPostAudit);
  }

  FutureOr<void> _viewPostAudit(PostAuditEvent event, Emitter<PostAuditState> emit) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var dataSertifikat = <SertifikatModel>[];
  emit(
    state.copyWith(
      status: PostAuditStateStatus.loading
    )
  );
  
  try{
    var url = Uri.parse(ApiConstant.viewSertifikat);
    var request = await http.post(
      url,
      body: {
        'id_klien' : prefs.getString('id_klien'),
        'level' : prefs.getString('level')
      }
    );

    var response = jsonDecode(request.body);

    for(int i=0; i<response.length; i++){
      dataSertifikat.add(SertifikatModel(
        idSertifikat: response[i]['id_sertifikat'],
        idDetailDok: response[i]['id_detail_dok'],
        namaKlien: response[i]['nama_klien'],
        namaIso: response[i]['nama_iso'],
        noSertifikat: response[i]['no_sertifikat'],
        tglTerbit: response[i]['tgl_terbit'],
        tglReassessment: response[i]['tgl_reass'],
        tglExpired: response[i]['2023-11-06'],
        fileSertifikat: 'http://123.100.226.123:3010/file_uploads/sertifikat/${response[i]['dok_file']}',
      ));
    } emit (
        state.copyWith(
          status: PostAuditStateStatus.success,
          dataSertifikat: dataSertifikat,
        )
    );
  } catch (error){
    print('Jajal $error');
    emit(
        state.copyWith(
          status: PostAuditStateStatus.error,
        )
    );
  }}
}
