import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pra_audit_event.dart';
part 'pra_audit_state.dart';

class PraAuditBloc extends Bloc<PraAuditEvent, PraAuditState> {
  PraAuditBloc() : super(PraAuditInitial()) {
    on<PraAuditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
