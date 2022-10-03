import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_container.dart';

class DashboardClient extends StatefulWidget {
  const DashboardClient({Key? key}) : super(key: key);

  @override
  State<DashboardClient> createState() => _DashboardClientState();
}

class _DashboardClientState extends State<DashboardClient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard Admin'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  CustomContainer(
                    color: Colors.blue,
                    icon: Icon(Icons.pageview),
                    text1: '1',
                    text2: 'Sertifikat Aktif',
                  ),
                  SizedBox(width: 10,),
                  CustomContainer(
                    color: Colors.blue,
                    icon: Icon(Icons.pageview),
                    text1: '1',
                    text2: 'Sertifikat Aktif',
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  CustomContainer(
                    color: Colors.blue,
                    icon: Icon(Icons.pageview),
                    text1: '1',
                    text2: 'Sertifikat Aktif',
                  ),
                  SizedBox(width: 10,),
                  CustomContainer(
                    color: Colors.blue,
                    icon: Icon(Icons.pageview),
                    text1: '1',
                    text2: 'Sertifikat Aktif',
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
