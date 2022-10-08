import 'package:flutter/material.dart';
import 'package:qims_mobile/aut_modul/ui/screen/login.dart';
import 'package:qims_mobile/aut_modul/ui/screen/register.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/dashboard_client.dart';
import 'package:qims_mobile/share/custom_routes.dart';

import 'menu/bottom_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: {
        CustomRoutes.registerPage : (context) => const Register(),
        CustomRoutes.loginPage : (context) => const Login(),
        CustomRoutes.dashboardClient : (context) => const DashboardClient(),
        CustomRoutes.menu : (context) => const BottomMenu(),
      },
    );
  }
}


