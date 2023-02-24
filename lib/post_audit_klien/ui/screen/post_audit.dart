import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/post_audit_klien/ui/bloc/post_audit_bloc.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../share/custom_collapse.dart';


class PostAuditClient extends StatefulWidget {
  const PostAuditClient({Key? key}) : super(key: key);

  @override
  State<PostAuditClient> createState() => _PostAuditClientState();
}

class _PostAuditClientState extends State<PostAuditClient> {
  SharedPreferences? pref;
  ///PDF Viewer
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    BlocProvider.of<PostAuditBloc>(context).add(OnViewSertifikat());
  }
  void getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          judul: 'Post Audit',
        ),
        body: BlocBuilder<PostAuditBloc, PostAuditState>(
          builder: (context, state){
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
                        title: Text('Sertifikat'),
                        trailing: Icon(Icons.keyboard_arrow_down),
                        subtitle: Text(' '),
                        curve: Curves.fastOutSlowIn,
                        children: [
                          Container(
                              child: state.dataSertifikat.isNotEmpty
                                  ?
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.dataSertifikat.length,
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
                                                    '${state.dataSertifikat[index].fileSertifikat}',
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
                                          Text('${state.dataSertifikat[index].namaIso}'),
                                          Text('${state.dataSertifikat[index].tglReassessment}',
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      // trailing: Text('${state.dataJadwalAudit[index].status}'),
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
        ),
      ),
    );
  }
}
