import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/dokumen/ui/bloc/dokumen_bloc.dart';
import 'package:qims_mobile/share/custom_appbar.dart';

import '../../../share/custom_routes.dart';

class DokumenDetail extends StatefulWidget {
  final bool isEdit;
  DokumenDetail({Key? key, required this.isEdit}) : super(key: key);


  @override
  State<DokumenDetail> createState() => _DokumenDetailState();
}
List<String> jenisDok = <String>['Form Registrasi','Manual', 'SOP', 'Dokumen Lainnya'];

class _DokumenDetailState extends State<DokumenDetail> {
  var namaDokController = TextEditingController();
  var jenisDokController = TextEditingController();
  var fileDokController = TextEditingController();
  String errorMessage = '';
  String dropDownValue = jenisDok.first;
  int? dropDownApi;
  String? pathFile;

  @override
  void initState() {
    BlocProvider.of<DokumenBloc>(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DokumenBloc, DokumenState>(
      listener: (context, state){
        ///Reset IsSussess
        if(state.isSucess != null){
          if(state.isSucess!){
            print('HALOO 1 ${state.isSucess}');
            // BlocProvider.of<DokumenBloc>(context).add(OnDokumenResetStatus());
            // Navigator.pushNamed(context, CustomRoutes.dokumenClient);
            Navigator.pop(context);
          }else{
            print('HALOO 2 ${state.isSucess}');
          }

        }
      },
      builder: (context, state){
        return Scaffold(
          appBar: const CustomAppBar(
            judul: 'Detail Dokumen',
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: widget.isEdit
            /// Form edit
                ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                TextFormField(
                  controller: namaDokController,
                  decoration: const InputDecoration(
                      labelText: 'Nama Dokumen'
                  ),
                ),
                const SizedBox(height: 20,),

                DropdownButton(
                  isExpanded: true,
                  value: dropDownValue,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropDownValue = value!;
                      if (value == 'Manual') {
                        dropDownApi = 0;
                      } else if (value == 'SOP') {
                        dropDownApi = 1;
                      } else if (value == 'Dokumen Lainnya') {
                        dropDownApi = 2;
                      } else {
                        dropDownApi = 3;
                      };
                    });
                  },
                  items: jenisDok.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20,),
                SizedBox(child:
                Row(
                  children: [
                    ElevatedButton(onPressed: () async{
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result == null) {
                        print('No File Selected');
                      } else {

                        result.files.forEach((element) {
                          setState(() {
                            pathFile = element.path;
                          });
                        });
                      }
                    }, child: const Text('Pilih File')),
                    const SizedBox(width: 20,),
                    Expanded(child: Text(pathFile ?? 'Belum dipilih'))
                  ],
                )),
                const SizedBox(height: 40,),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                )
              ],
            )
            /// Form Input
                : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                TextFormField(
                  controller: namaDokController,
                  decoration: const InputDecoration(
                      labelText: 'Nama Dokumen'
                  ),
                  onChanged: (value){
                    if(value != ''){
                      BlocProvider.of<DokumenBloc>(context).add(OnDokumenResetStatus());
                    }
                  },
                ),
                const SizedBox(height: 20,),

                DropdownButton(
                  isExpanded: true,
                  value: dropDownValue,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropDownValue = value!;
                      if (value == 'Manual') {
                        dropDownApi = 0;
                      } else if (value == 'SOP') {
                        dropDownApi = 1;
                      } else if (value == 'Dokumen Lainnya') {
                        dropDownApi = 2;
                      } else {
                        dropDownApi = 3;
                      };
                    });
                  },
                  items: jenisDok.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20,),
                SizedBox(child:
                Row(
                  children: [
                    ElevatedButton(onPressed: () async{
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result == null) {
                        print('No File Selected');
                      } else {

                        result.files.forEach((element) {
                          setState(() {
                            pathFile = element.path;
                          });
                        });
                      }
                    }, child: const Text('Pilih FIle')),
                    const SizedBox(width: 20,),
                    Expanded(child: Text(pathFile ?? 'Belum dipilih'))
                  ],
                )),


                SizedBox(child: Text('${namaDokController.text != null || namaDokController.text != '' ? '' : state.message}'),),
                // state.message != null ?  SizedBox(child: Text('${namaDokController.text != null || namaDokController.text != '' ? '' : state.message}'),):SizedBox(),

                const SizedBox(height: 40,),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DokumenBloc>(context).add(OnDokumenTambah(
                        nama_dok: namaDokController.text,
                        jenis_dok: '$dropDownApi',
                        file: File('$pathFile'),
                      ));
                    },
                    child: const Text(
                      'Tambah',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                ),
                state.isSucess != null ? !state.isSucess! ? SizedBox(child: Text('Dokumen Gagal Disimpan'),) : SizedBox() : SizedBox()
            ],
            ),
          ),
        );
      },
    );
  }
}
