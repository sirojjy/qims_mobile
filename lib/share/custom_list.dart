import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final List<String> judul_doc = ['Manual ISO 9001:2015', 'SOP', 'Lampiran', 'Kebijakan Mutu'];
  final List<String> jenis_doc = ['Manual', 'SOP', 'Dokumen Lainnya', 'Dokumen Lainnya'];

  CustomList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: judul_doc.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.file_open),
            title: Text(judul_doc[index]),
            trailing: Icon(Icons.edit),
            subtitle: Text(jenis_doc[index]),
          ),
        );
      },
    );
  }
}
