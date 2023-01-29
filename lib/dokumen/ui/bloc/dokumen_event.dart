part of 'dokumen_bloc.dart';

class DokumenEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class OnDokumenView extends DokumenEvent {

}

class OnDokumenEdit extends DokumenEvent {
  final String? nama_dok;
  final String? jenis_dok;
  final File? file;

  OnDokumenEdit(this.nama_dok, this.jenis_dok, this.file);
}

class OnDokumenTambah extends DokumenEvent {
  final String? nama_dok;
  final String? jenis_dok;
  final File? file;

  OnDokumenTambah(this.nama_dok, this.jenis_dok, this.file);
}