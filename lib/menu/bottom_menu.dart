import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/audit_client.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/dashboard_client.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/dokumen_klien.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/post_audit.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/pra_audit_client.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState() => _MenuState();
}

class _MenuState extends State<BottomMenu> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", Colors.blue, labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.search, "Pra-Audit", Colors.orange, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.layers, "Audit", Colors.red),
    TabItem(Icons.notifications, "Post-Audit", Colors.cyan),
    TabItem(Icons.person, "Dokumen", Colors.green),
  ]);

  var _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 200),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return DashboardClient();
      case 1:
        return PraAuditClient();
      case 2:
        return AuditClient();
      case 3:
        return PostAuditClient();
      case 4:
        return DokumenClient();
      default:
        return DashboardClient();
    }
  }

}
