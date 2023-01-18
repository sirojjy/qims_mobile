import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import '../../../share/custom_collapse.dart';


class PraAuditClient extends StatefulWidget {

  const PraAuditClient({Key? key}) : super(key: key);

  @override
  State<PraAuditClient> createState() => _PraAuditClientState();
}

class _PraAuditClientState extends State<PraAuditClient> {
  @override
  Widget build(BuildContext context) {
    final jenisAudit = ['Sertifikasi', 'Surveillance', 'Surveillance', 'Re-sertifikasi'];
    final iconTiles = [
      Icons.file_open,
      Icons.directions_boat,
      Icons.directions_bus,
      Icons.directions_car,
    ];


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
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: RoundedExpansionTile(
                    leading: Icon(Icons.calendar_month),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: Text('Jadwal Audit'),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    subtitle: Text(' '),
                    curve: Curves.fastOutSlowIn,
                    children: [
                      Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: jenisAudit.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  leading: Icon(iconTiles[index]),
                                  title: Text(jenisAudit[index]),
                                ),
                              );
                            },
                          )
                      )
                    ],),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
