import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/audit_klien/ui/bloc/audit_klien_bloc.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../share/custom_collapse.dart';


class AuditKlien extends StatefulWidget {
  const AuditKlien({Key? key}) : super(key: key);

  @override
  State<AuditKlien> createState() => _AuditKlienState();
}

class _AuditKlienState extends State<AuditKlien> {
  SharedPreferences? pref;
  ///PDF Viewer
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    getPref();
    BlocProvider.of<AuditKlienBloc>(context).add(OnViewDaftarhadir());
    BlocProvider.of<AuditKlienBloc>(context).add(OnViewOpeningClosing());
    BlocProvider.of<AuditKlienBloc>(context).add(OnViewNcr());
    BlocProvider.of<AuditKlienBloc>(context).add(OnViewStage2());
  }
  void getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          judul: 'Pelaksanaan Audit',
        ),
        body: BlocBuilder<AuditKlienBloc, AuditKlienState>(
          builder: (context, state){
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),

                    ///DAFTAR HADIR
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: RoundedExpansionTile(
                        leading: Icon(Icons.calendar_month),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text('Daftar Hadir'),
                        trailing: Icon(Icons.keyboard_arrow_down),
                        subtitle: Text(' '),
                        curve: Curves.fastOutSlowIn,
                        children: [
                          Container(
                              child: state.dataDaftarHadir.isNotEmpty
                                  ?
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.dataDaftarHadir.length,
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
                                                    '${state.dataDaftarHadir[index].fileDaftarHadir}',
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
                                          Text('${state.dataDaftarHadir[index].namaIso}'),
                                          Text('${state.dataDaftarHadir[index].tglAudit}',
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      // trailing: Text('${state.dataDaftarHadir[index].namaKlien}'),
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
                    const SizedBox(height: 10,),

                    ///OPENING CLOSING
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: RoundedExpansionTile(
                        leading: Icon(Icons.calendar_month),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text('Opening Closing'),
                        trailing: Icon(Icons.keyboard_arrow_down),
                        subtitle: Text(' '),
                        curve: Curves.fastOutSlowIn,
                        children: [
                          Container(
                              child: state.dataOpeningClosing.isNotEmpty
                                  ?
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.dataOpeningClosing.length,
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
                                                    '${state.dataOpeningClosing[index].fileOpeningClosing}',
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
                                          Text('${state.dataOpeningClosing[index].namaIso}'),
                                          Text('${state.dataOpeningClosing[index].tglAudit}',
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      // trailing: Text('${state.dataOpeningClosing[index].namaKlien}'),
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
                    const SizedBox(height: 10,),

                    /// NCR
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: RoundedExpansionTile(
                        leading: Icon(Icons.calendar_month),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text('NCR'),
                        trailing: Icon(Icons.keyboard_arrow_down),
                        subtitle: Text(' '),
                        curve: Curves.fastOutSlowIn,
                        children: [
                          Container(
                              child: state.dataNcr.isNotEmpty
                                  ?
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.dataNcr.length,
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
                                                    '${state.dataNcr[index].fileNcr}',
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
                                          Text('${state.dataNcr[index].namaIso}'),
                                          Text('${state.dataNcr[index].tglNcr}',
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      // trailing: Text('${state.dataOpeningClosing[index].namaKlien}'),
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
                    const SizedBox(height: 10,),

                    /// Stage 2
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: RoundedExpansionTile(
                        leading: Icon(Icons.calendar_month),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text('Laporan Stage II'),
                        trailing: Icon(Icons.keyboard_arrow_down),
                        subtitle: Text(' '),
                        curve: Curves.fastOutSlowIn,
                        children: [
                          Container(
                              child: state.dataStage2.isNotEmpty
                                  ?
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.dataStage2.length,
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
                                                    '${state.dataStage2[index].fileStage2}',
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
                                          Text('${state.dataStage2[index].namaIso}'),
                                          Text('${state.dataStage2[index].tglStage2}',
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      // trailing: Text('${state.dataOpeningClosing[index].namaKlien}'),
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
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}