import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:qims_mobile/dashboard_client/model/stepper_model.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import 'package:qims_mobile/share/custom_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardClient extends StatefulWidget {
  const DashboardClient({Key? key}) : super(key: key);

  @override
  State<DashboardClient> createState() => _DashboardClientState();
}

class _DashboardClientState extends State<DashboardClient> {
  int groupValue = 0;
  
  SharedPreferences? pref;
  var namaKlien;
  

  StepperType _type = StepperType.vertical;

  List<StepperModel> tuples = [
    StepperModel(Icons.directions_bike, 'Tahun 1', '08-09-2022'),
    StepperModel(Icons.directions_bus, 'Tahun 1', '08-09-2022'),
    StepperModel(Icons.directions_railway, 'Tahun 1', '08-09-2022'),
    StepperModel(Icons.directions_boat, 'Tahun 1', '08-09-2022'),
    StepperModel(Icons.directions_car, 'Tahun 1', '08-09-2022'),
  ];

  int _index = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();
  }

  void getPref() async {
    pref = await SharedPreferences.getInstance();

    setState(() {
      namaKlien = pref!.getString('nama');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(judul: 'Dashboard'),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomContainer(
                        color1: Color(0xff1AF0AC),
                        color2: Color(0xff11B9AF),
                        icon: Icons.pageview,
                        text1: '1',
                        text2: 'Sertifikat Aktif',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomContainer(
                        color1: Color(0xff52E5E7),
                        color2: Color(0xff108CFF),
                        icon: Icons.pageview,
                        text1: '1',
                        text2: 'Kegiatan Dijadwalkan',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomContainer(
                        color1: Color(0xffFCCF31),
                        color2: Color(0xffF55555),
                        icon: Icons.pageview,
                        text1: '0',
                        text2: 'Jadwal Akan Datang',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomContainer(
                        color1: Color(0xffF761A1),
                        color2: Color(0xff8C1BAB),
                        icon: Icons.pageview,
                        text1: '0',
                        text2: 'Kegiatan Selesai',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),



                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text('Profil',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama'),
                                Text('Alamat'),
                                Text('PIC'),
                                Text('No. HP'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(':'),
                                Text(':'),
                                Text(':'),
                                Text(':'),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$namaKlien'),
                                  Text(
                                      'Jl. Penyu No. 12, Cilacap, Jawa Tengah'),
                                  Text('Bu Eko'),
                                  Text('08128xxxxxxx'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      // alignment: Alignment.centerLeft,
                      //   height: 900,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                          ]),
                      child: Column(
                        children: [
                          Text('Status Audit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),

                          EnhanceStepper(
                            // stepIconSize: 60,
                              type: _type,
                              horizontalTitlePosition:
                              HorizontalTitlePosition.bottom,
                              horizontalLinePosition: HorizontalLinePosition.top,
                              currentStep: tuples.length - 1,
                              physics: ClampingScrollPhysics(),
                              steps: tuples
                                  .map((e) => EnhanceStep(
                                  icon: Icon(
                                    e.directions_bike,
                                    // Icons.add,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  state: StepState.values[tuples.indexOf(e)],
                                  isActive: _index == tuples.indexOf(e),
                                  title: Text(e.tanggal ?? ''),
                                  subtitle: Text(e.description ?? ''),
                                  content: SizedBox()))
                                  .toList(),
                              onStepCancel: () {
                                // go(-1);
                              },
                              onStepContinue: () {
                                // go(1);
                              },
                              onStepTapped: (index) {
                                // ddlog(index);
                                setState(() {
                                  _index = index;
                                });
                              },
                              controlsBuilder:
                                  (BuildContext context, ControlsDetails details) {
                                return SizedBox();
                              })

                        ],
                      )


            ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // alignment: Alignment.centerLeft,
                    //   height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                    ]),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Lokasi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),



                          // ElevatedButton(
                          //   onPressed: () => MapsLauncher.launchQuery(
                          //       '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA'),
                          //   child: Text('LAUNCH QUERY'),
                          // ),
                          // SizedBox(height: 32),

                          ElevatedButton(
                            onPressed: () => MapsLauncher.launchCoordinates(
                                37.4220041,
                                -122.0862462,
                                'Google Headquarters are here'),
                            child: Text('LAUNCH COORDINATES'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }

}

