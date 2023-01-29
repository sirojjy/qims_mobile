import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';

class DokumenDetail extends StatefulWidget {
  final bool isEdit;
  DokumenDetail({Key? key, required this.isEdit}) : super(key: key);


  @override
  State<DokumenDetail> createState() => _DokumenDetailState();
}
List<String> jenisDok = <String>['Manual', 'SOP', 'Dokumen Lainnya'];

class _DokumenDetailState extends State<DokumenDetail> {
  String dropDownValue = jenisDok.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            judul: 'Detail Dokumen',
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: widget.isEdit
                /// Fprm edit
                ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                TextFormField(
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
                SizedBox(child: Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Pilih FIle')),
                    const SizedBox(width: 20,),
                    const Text('Belum dipilih')
                  ],
                )),
                const SizedBox(height: 40,),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Simpan',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                )
              ],
            )
                /// Form INput
                : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nama Dokumen'
                  ),
                ),
                const SizedBox(height: 20,),

                DropdownButton(
                  isExpanded: true,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropDownValue = value!;
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
                SizedBox(child: Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Pilih FIle')),
                    const SizedBox(width: 20,),
                    const Text('Belum dipilih')
                  ],
                )),
                const SizedBox(height: 40,),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Tambah',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                )
              ],
            ),
          ),
        ),
    );
  }
}
