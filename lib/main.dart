import 'package:flutter/material.dart';
import 'package:qims_mobile/aut_modul/ui/screen/login.dart';
import 'package:qims_mobile/aut_modul/ui/screen/register.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/audit_client.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/dashboard_client.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/dokumen_klien.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/post_audit.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/pra_audit_client.dart';
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
      home: const LoginScreen(),
      routes: {
        CustomRoutes.registerPage : (context) => const Register(),
        CustomRoutes.loginPage : (context) => const LoginScreen(),
        CustomRoutes.dashboardClient : (context) => const DashboardClient(),
        CustomRoutes.menu : (context) => const BottomMenu(),
        CustomRoutes.praAuditClient : (context) => const PraAuditClient(),
        CustomRoutes.auditClient : (context) => const AuditClient(),
        CustomRoutes.postAuditClient : (context) => const PostAuditClient(),
        CustomRoutes.dokumenClient : (context) => const DokumenClient(),
      },
    );
  }
}


