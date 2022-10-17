import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class CustomCollapse extends StatelessWidget {

  final String? titles;
  final String? descriptions;
  final IconData icons;
  final jenisAudit = ['Sertifikasi', 'Surveillance', 'Surveillance', 'Re-sertifikasi'];
  final iconTiles = [Icons.directions_bike, Icons.directions_boat, Icons.directions_bus, Icons.directions_car,];

  CustomCollapse({Key? key, required this.titles, this.descriptions, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: RoundedExpansionTile(
        leading: Icon(icons),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        title: Text('$titles'),
        trailing: Icon(Icons.keyboard_arrow_down),
        subtitle: Text('$descriptions'),
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
        ],
      ),
    );
  }
}
