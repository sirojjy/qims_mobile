import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';

class DokumenDetail extends StatefulWidget {
  const DokumenDetail({Key? key}) : super(key: key);

  @override
  State<DokumenDetail> createState() => _DokumenDetailState();
}

class _DokumenDetailState extends State<DokumenDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            judul: 'Dokumen Klien',
          ),
          body: Container(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Dokumen'
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
