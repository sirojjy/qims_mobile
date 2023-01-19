import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/dashboard_client/ui/bloc/dashboard_bloc.dart';
import 'package:qims_mobile/dokumen/ui/bloc/dokumen_bloc.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:qims_mobile/share/custom_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../share/custom_collapse.dart';


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


  // List<Item> itemenu = [];
  //  = <Item>[
  //   Item('Edit', Icon(Icons.edit)),
  //   Item('Hapus', Icon(Icons.delete)),
  // ];

  // String _item = "Aksi";
  // final _items = ["Aksi", "Edit", "Hapus"];
  //
  // @override
  // void initState() {
       // TODO: implement initState
  //   super.initState();
  //   itemenu.addAll(
  //     [
  //       Item('Edit', Icon(Icons.edit)),
  //       Item('Hapus', Icon(Icons.delete))
  //     ],
  //   );
  // }

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
                        title: Text('${state.data[index].namaDokumen}'),
                        subtitle: Text('${state.data[index].jenisDok}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: (){},
                            ),
                            // SizedBox(width: 20,),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: (){},
                            ),
                          ],
                        )
                      // DropdownButton(
                      //   items: _items
                      //       .map((String item) =>
                      //       DropdownMenuItem<String>(
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             children: [
                      //               SizedBox(
                      //                 width: 50,
                      //                   child: Text(item)),
                      //               SizedBox(width: 20,),
                      //               item == 'Edit' ? Icon(Icons.edit) :
                      //               item == 'Hapus' ? Icon(Icons.delete) :
                      //               SizedBox()
                      //             ],
                      //           ), value: item))
                      //       .toList(),
                      //   onChanged: (value) {
                      //     // setState(() {
                      //     //   print("previous ${this._salutation}");
                      //     //   print("selected $value");
                      //     //   this._salutation = value;
                      //     // });
                      //   },
                      //   value: _item,
                      // ),
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


