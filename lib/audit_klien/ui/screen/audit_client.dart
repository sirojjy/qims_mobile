import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import '../../../share/custom_collapse.dart';


class AuditClient extends StatefulWidget {
  const AuditClient({Key? key}) : super(key: key);

  @override
  State<AuditClient> createState() => _AuditClientState();
}

class _AuditClientState extends State<AuditClient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          judul: 'Pelaksanaan Audit',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                CustomCollapse(
                  icons: Icons.date_range_rounded,
                  titles: 'Daftar Hadir',
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
