import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:qims_mobile/share/custom_list.dart';
import '../../../share/custom_collapse.dart';


class DokumenClient extends StatefulWidget {

  // final IconData? icon;


  DokumenClient({Key? key}) : super(key: key);

  @override
  State<DokumenClient> createState() => _DokumenClientState();
}

class Item {
  Item(this.name, this.icon);
  final String name;
  final Icon icon;

}

class _DokumenClientState extends State<DokumenClient> {
  final List<String> judul_doc = ['Manual ISO 9001:2015', 'SOP', 'Lampiran', 'Kebijakan Mutu'];
  final List<String> jenis_doc = ['Manual', 'SOP', 'Dokumen Lainnya', 'Dokumen Lainnya'];

  List items = [
    Item('Edit', Icon(Icons.edit)),
    Item('Hapus', Icon(Icons.delete)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          judul: 'Dokumen Klien',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: judul_doc.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.file_open_outlined),
                    title: Text(judul_doc[index]),
                    subtitle: Text(jenis_doc[index]),
                    trailing: DropdownButton(
                      value: Text('Aksi'),
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      items: items.map((map) => DropdownMenuItem<String>(
                            child: Row(
                              children: [
                                Item.name,
                                SizedBox(
                                  width: 10,
                                ),
                                Text(items.name),
                              ],
                            )
                        )
                      ).toList(), onChanged: (value) {  },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
