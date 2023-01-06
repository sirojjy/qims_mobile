import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import '../../../share/custom_collapse.dart';


class PraAuditClient extends StatefulWidget {
  const PraAuditClient({Key? key}) : super(key: key);

  @override
  State<PraAuditClient> createState() => _PraAuditClientState();
}

class _PraAuditClientState extends State<PraAuditClient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            judul: 'Pra Audit',
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  CustomCollapse(
                    icons: Icons.date_range_rounded,
                    titles: 'Jadwal Audit',
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
