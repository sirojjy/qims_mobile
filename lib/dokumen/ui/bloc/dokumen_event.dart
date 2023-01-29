part of 'dokumen_bloc.dart';

class DokumenEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class OnDokumenEvent extends DokumenEvent {

}

class OnDokumenEdit extends DokumenEvent {
  final String? nama_dok;
  final String? jenis_dok;
  final File? file_dok;

  OnDokumenEdit(this.nama_dok, this.jenis_dok, this.file_dok);
}

class OnDokumenTambah extends DokumenEvent {

}