import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:qims_mobile/dashboard_client/model/stepper_model.dart';
import 'package:qims_mobile/share/custom_container.dart';
import 'package:timelines/timelines.dart';

class DashboardClient extends StatefulWidget {
  const DashboardClient({Key? key}) : super(key: key);

  @override
  State<DashboardClient> createState() => _DashboardClientState();
}

class _DashboardClientState extends State<DashboardClient> {
  int groupValue = 0;

  StepperType _type = StepperType.vertical;

  List<StepperModel> tuples = [
    StepperModel(Icons.directions_bike, StepState.indexed, ),
    StepperModel(Icons.directions_bus, StepState.editing, ),
    StepperModel(Icons.directions_railway, StepState.complete, ),
    StepperModel(Icons.directions_boat, StepState.disabled, ),
    StepperModel(Icons.directions_car, StepState.error, ),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              child: Image.asset(
                'assets/images/logo_qai.jpg',
                scale: 1,
                // height: 10,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          title: Text('Dashboard User'),
          actions: [
            Container(
              width: 50,
              child: Icon(Icons.person),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child:
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomContainer(
                      color: Colors.blue,
                      icon: Icons.pageview,
                      text1: '1',
                      text2: 'Sertifikat Aktif',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomContainer(
                      color: Colors.blue,
                      icon: Icons.pageview,
                      text1: '1',
                      text2: 'Sertifikat Aktif',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomContainer(
                      color: Colors.blue,
                      icon: Icons.pageview,
                      text1: '1',
                      text2: 'Sertifikat Aktif',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomContainer(
                      color: Colors.blue,
                      icon: Icons.pageview,
                      text1: '1',
                      text2: 'Sertifikat Aktif',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(5)),
                  child:
                  Column(
                    children: [
                      Row(
                          children: [
                            Expanded(child:
                            Text('Sertifikat',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            ),
                          ]),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              'assets/images/9001.png',
                              height: 60,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('PPS Cilacap',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(height: 5,),
                                  SizedBox(
                                    width: 120,
                                    child: Text("ISO 9001:2015"),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child:Text('Scope : Provision of Management and Administration of Fish Diseases, Quality and Safety of Fishery Product'),
                                  )
                                ],
                              )

                          )
                        ],
                      ),

                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              width: 150,
                              height: 35,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  'Lihat Sertifikat',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(5)),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child:
                          Text('Profil',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),

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
                          SizedBox(width: 10,),
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
                                Text('PPS Cilacap'),
                                Text('Jl. Penyu No. 12, Cilacap, Jawa Tengah'),
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
                SizedBox(height: 10,),

                Container(
                  // alignment: Alignment.centerLeft,
                  //   height: 900,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(5)),
                   child:
                   EnhanceStepper(
                     // stepIconSize: 60,
                       type: _type,
                       horizontalTitlePosition: HorizontalTitlePosition.bottom,
                       horizontalLinePosition: HorizontalLinePosition.top,
                       currentStep: tuples.length-1,
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
                         title: Text("step ${tuples.indexOf(e)}"),
                         subtitle: Text(
                           "${e.indexed.toString().split(".").last}",
                         ),
                         content: SizedBox()
                       ))
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
                       controlsBuilder: (BuildContext context, ControlsDetails details) {
                         return SizedBox(

                         );
                       })
                ),

                SizedBox(height: 10,),
              ],
            ),
          ),
        )
      ),
    );
  }
}
