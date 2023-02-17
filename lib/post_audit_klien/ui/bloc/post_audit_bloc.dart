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
    on<PostAuditEvent>(_viewPostAudit});
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
          namaKlien: response[i]['nama_klien'],
          namaIso: response[i]['nama_iso'],
          tglAudit: response[i][''],
          idSertifikat,
          idDetailDok,
          fileDaftarHadir
      ))
    }
  }
}
