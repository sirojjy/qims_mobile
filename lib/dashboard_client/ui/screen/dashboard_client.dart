import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_button.dart';
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
          title: Text('Dashboard Admin1'),
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
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child:
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                  'assets/images/9001.png',
                                height: 60,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'abcx',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width: 120,
                                    child: Text(
                                      "Sertifikat ISO"
                                    ),
                                ),
                                SizedBox(height: 5,),
                                InkWell(
                                  child: Container(
                                    width: 150,
                                    height: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Text('Lihat Sertifikat',
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
                      )
                    // Container(
                    //   padding: EdgeInsets.only(top: 20, bottom: 20),
                    //   color: Colors.grey[300],
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Text('Certificate Registration'),
                    //         ],
                    //       ),
                    //       SizedBox(height: 10,),
                    //
                    //       // Row(
                    //       //   children: [
                    //       //     Icon(Icons.picture_in_picture),
                    //       //     // Container(child:
                    //       //     //   Column(
                    //       //     //     children: [
                    //       //     //       Text('ISO 9001:2015',),
                    //       //     //       Text('No Sertifikat : QAIC/ID/11066-A'),
                    //       //     //       Text('Scope : Provision of Management and Administration of Fish Diseases, Quality and Safety of Fishery Product',),
                    //       //     //       CustomButton(
                    //       //     //         text: 'Lihat Sertifikat', onKlick: (){})
                    //       //     //     ],
                    //       //     //   )
                    //       //     // ),
                    //       //   ],
                    //       // )
                    //     ],
                    //   )
                    //
                    // ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
