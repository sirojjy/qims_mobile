import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/dashboard_client.dart';

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
    TabItem(Icons.search, "Search", Colors.orange, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.layers, "Reports", Colors.red),
    TabItem(Icons.notifications, "Notifications", Colors.cyan),
    TabItem(Icons.person, "Notifications", Colors.green),
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
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
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
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 300),
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
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text('HALOOO'),
          ),
        );
      case 2:
        return DashboardClient();
      case 3:
        return DashboardClient();
      case 4:
        return DashboardClient();
      default:
        return DashboardClient();
    }
  }

}
