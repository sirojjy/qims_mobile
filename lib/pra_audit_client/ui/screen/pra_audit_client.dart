import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/pra_audit_client/ui/bloc/pra_audit_bloc.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:qims_mobile/share/custom_button.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../share/custom_collapse.dart';


class PraAuditClient extends StatefulWidget {

  const PraAuditClient({Key? key}) : super(key: key);

  @override
  State<PraAuditClient> createState() => _PraAuditClientState();
}

class _PraAuditClientState extends State<PraAuditClient> {
  SharedPreferences? pref;

  ///PDF Viewer
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    BlocProvider.of<PraAuditBloc>(context).add(OnPraAuditView());
    BlocProvider.of<PraAuditBloc>(context).add(OnViewJadwalAudit());
    BlocProvider.of<PraAuditBloc>(context).add(OnViewSuratTugas());
    getPref();
  }
  void getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            judul: 'Pra Audit',
          ),
          body: BlocBuilder<PraAuditBloc, PraAuditState>(
            builder: ( context, state) {
              // print('API : ${state.dataJadwalAudit.length}');
              // print('API Nama Klien: ${state.dataSuratTugas[0].noSurat}');
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      ///JADWAL AUDIT
                      const SizedBox(height: 10,),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: RoundedExpansionTile(
                          leading: Icon(Icons.calendar_month),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: Text('Jadwal Audit'),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          subtitle: Text(' '),
                          curve: Curves.fastOutSlowIn,
                          children: [
                            Container(
                                child: state.dataJadwalAudit.isNotEmpty
                                    ?
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: state.dataJadwalAudit.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(

                                        leading: Icon(Icons.file_open_outlined),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${state.dataJadwalAudit[index].jenisAudit}'),
                                            Text('${state.dataJadwalAudit[index].tanggalJadwal}',
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                        trailing: Text('${state.dataJadwalAudit[index].status}'),
                                      ),
                                    );
                                  },
                                )
                                    : Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width* 0.25,
                                    height: 30,
                                    child: const Text('Data Kosong'),
                                  ),
                                )
                            ),
                          ],),
                      ),

                      ///RENCANA AUDIT
                      const SizedBox(height: 10,),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: RoundedExpansionTile(
                          leading: Icon(Icons.calendar_month),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: Text('Rencana Audit'),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          subtitle: Text(' '),
                          curve: Curves.fastOutSlowIn,
                          children: [
                            Container(
                                child: state.data.isNotEmpty
                                    ?
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  // elevation: 16,
                                                  child: Container(
                                                    child: SfPdfViewer.network(
                                                      '${state.data[index].dokFile}',
                                                      key: _pdfViewerKey,
                                                    ),
                                                  ),
                                                );
                                              }
                                          );
                                        },
                                        leading: Icon(Icons.file_open_outlined),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${state.data[index].nomorSurat}'),
                                            Text('${state.data[index].namaIso}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text('${state.data[index].tanggal}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                                    : Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width* 0.25,
                                    height: 30,
                                    child: const Text('Data Kosong'),
                                  ),
                                )
                            ),
                          ],),
                      ),

                      ///SURAT TUGAS
                      const SizedBox(height: 10,),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: RoundedExpansionTile(
                          leading: Icon(Icons.calendar_month),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: Text('Surat Tugas'),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          subtitle: Text(' '),
                          curve: Curves.fastOutSlowIn,
                          children: [
                            Container(
                                child: state.dataSuratTugas.isNotEmpty
                                    ?
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: state.dataSuratTugas.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  // elevation: 16,
                                                  child: Container(
                                                    child: SfPdfViewer.network(
                                                      '${state.dataSuratTugas[index].fileSurat}',
                                                      key: _pdfViewerKey,
                                                    ),
                                                  ),
                                                );
                                              }
                                          );
                                        },
                                        leading: Icon(Icons.file_open_outlined),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${state.dataSuratTugas[index].noSurat}'),
                                            Text('${state.dataSuratTugas[index].namaIso}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text('${state.dataSuratTugas[index].tanggalSurat}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                                    : Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width* 0.25,
                                    height: 30,
                                    child: const Text('Data Kosong'),
                                  ),
                                )
                            ),
                          ],),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ),
    );
  }
}
