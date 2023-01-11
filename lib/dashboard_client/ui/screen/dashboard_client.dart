import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:qims_mobile/dashboard_client/model/stepper_model.dart';
import 'package:qims_mobile/dashboard_client/ui/bloc/dashboard_bloc.dart';
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
  var alamat;
  var profil;
  

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
      // namaKlien = pref!.getString('nama');
      // alamat = pref!.getString('alamat');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(judul: 'Dashboard'),
          body: SingleChildScrollView(
            child: BlocBuilder<DashboardBloc, DashboardState> (
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          CustomContainer(
                            color1: Color(0xff1AF0AC),
                            color2: Color(0xff11B9AF),
                            icon: Icons.check_box,
                            text1: '1',
                            text2: 'Sertifikat Aktif',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomContainer(
                            color1: Color(0xff52E5E7),
                            color2: Color(0xff108CFF),
                            icon: Icons.calendar_month,
                            text1: '1',
                            text2: 'Kegiatan Dijadwalkan',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          CustomContainer(
                            color1: Color(0xffFCCF31),
                            color2: Color(0xffF55555),
                            icon: Icons.schedule_sharp,
                            text1: '0',
                            text2: 'Jadwal Akan Datang',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomContainer(
                            color1: Color(0xffF761A1),
                            color2: Color(0xff8C1BAB),
                            icon: Icons.done_all,
                            text1: '0',
                            text2: 'Kegiatan Selesai',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),



                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                          ],
                        ),
                        child: Table(
                          // border: TableBorder.all(),
                          columnWidths: <int, TableColumnWidth>{
                            0 : IntrinsicColumnWidth(),
                            1 : FlexColumnWidth(),
                          },
                          children: <TableRow>[
                            TableRow(
                                children: [
                                  Container(
                                    height: 30,
                                    child: Text('Nama '),
                                  ),
                                  Container(
                                    height: 30,
                                    child: Text(state.profil ?? ''),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Container(
                                    height: 30,
                                    child: Text('Alamat '),
                                  ),
                                  Container(
                                    height: 30,
                                    child: Text(': $alamat'),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Container(
                                    height: 30,
                                    child: Text('Kontak Person '),
                                  ),
                                  Container(
                                    height: 30,
                                    child: Text(': '),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Container(
                                    height: 30,
                                    child: Text('No. HP. '),
                                  ),
                                  Container(
                                    height: 30,
                                    child: Text(': '),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        // alignment: Alignment.centerLeft,
                        //   height: 900,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                              ]),
                          child: Column(
                            children: [
                              const Text('Status Audit',
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
                                  physics: const ClampingScrollPhysics(),
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
                                      content: const SizedBox()))
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
                                    return const SizedBox();
                                  })

                            ],
                          )


                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        // alignment: Alignment.centerLeft,
                        //   height: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                            ]),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text('Lokasi',
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
                                child: const Text('LAUNCH COORDINATES'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            )
          ),
      ),
    );
  }

}

