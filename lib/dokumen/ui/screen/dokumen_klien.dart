import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/dokumen/ui/bloc/dokumen_bloc.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class DokumenClient extends StatefulWidget {

  // final IconData? icon;

  DokumenClient({Key? key}) : super(key: key);

  @override
  State<DokumenClient> createState() => _DokumenClientState();
}


class _DokumenClientState extends State<DokumenClient> {
  final List<String> judul_doc = ['Manual ISO 9001:2015', 'SOP', 'Lampiran', 'Kebijakan Mutu'];
  final List<String> jenis_doc = ['Manual', 'SOP', 'Dokumen Lainnya', 'Dokumen Lainnya'];
  SharedPreferences? pref;

  //PDF Viewer
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    BlocProvider.of<DokumenBloc>(context).add(OnDokumenEvent());
    getPref();
  }
  void getPref() async{
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // print('ININI : ${itemenu.length}');
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          judul: 'Dokumen Klien',
        ),
        body: BlocBuilder<DokumenBloc, DokumenState> (
          builder: (context, state){
            return Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: state.data.isNotEmpty
                  ?
              ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return Card(

                    child: ListTile(
                        leading: GestureDetector(
                          child: Icon(Icons.file_open_outlined),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    // elevation: 16,
                                    child: Container(
                                      child: SfPdfViewer.network(
                                        '${state.data[index].fileDok}',
                                        key: _pdfViewerKey,
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                        ),
                        title: GestureDetector(
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${state.data[index].namaDokumen}'),
                                Text(
                                  '${state.data[index].jenisDok}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        // subtitle: Text('${state.data[index].jenisDok}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: (){},
                            ),
                          ],
                        )
                    ),
                  );
                },
              )
                  :
              const Text('Data Empty'),
            );
          },
        ),
      ),
    );
  }
}


