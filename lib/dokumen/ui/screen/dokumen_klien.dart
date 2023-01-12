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

// class Item {
//   Item(this.name, this.icon);
//   final String name;
//   final Icon icon;
//
// }

class _DokumenClientState extends State<DokumenClient> {
  final List<String> judul_doc = ['Manual ISO 9001:2015', 'SOP', 'Lampiran', 'Kebijakan Mutu'];
  final List<String> jenis_doc = ['Manual', 'SOP', 'Dokumen Lainnya', 'Dokumen Lainnya'];
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: (){},
                        ),
                        // SizedBox(width: 20,),
                        IconButton(
                          icon: Icon(Icons.delete),
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
            ),
          ),
        ),
      ),
    );
  }
}
