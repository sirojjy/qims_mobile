import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dokumen_event.dart';
part 'dokumen_state.dart';

class DokumenBloc extends Bloc<DokumenEvent, DokumenState> {
  DokumenBloc() : super(DokumenInitial()) {
    on<DokumenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
