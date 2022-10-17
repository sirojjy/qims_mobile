import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import '../../../share/custom_collapse.dart';


class DokumenClient extends StatefulWidget {
  const DokumenClient({Key? key}) : super(key: key);

  @override
  State<DokumenClient> createState() => _DokumenClientState();
}

class _DokumenClientState extends State<DokumenClient> {
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
            child: Column(
              children: [
                const SizedBox(height: 10,),
                CustomCollapse(
                  icons: Icons.date_range_rounded,
                  titles: 'Manual ISO',
                  descriptions: '',
                ),
                CustomCollapse(
                  icons: Icons.date_range_rounded,
                  titles: 'Prosedur',
                  descriptions: '',
                ),
                CustomCollapse(
                  icons: Icons.date_range_rounded,
                  titles: 'Lainnya',
                  descriptions: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
