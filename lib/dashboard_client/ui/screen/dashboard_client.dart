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
          title: Text('Dashboard Admin1'),
        ),
        body: Container(
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
                    icon: Icon(Icons.pageview),
                    text1: '1',
                    text2: 'Sertifikat Aktif',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomContainer(
                    color: Colors.blue,
                    icon: Icon(Icons.pageview),
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
                    icon: Icon(Icons.pageview),
                    text1: '1',
                    text2: 'Sertifikat Aktif',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomContainer(
                    color: Colors.blue,
                    icon: Icon(Icons.pageview),
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
                      children: [
                        Column(children: [
                          SizedBox(height: 10,),
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
                              Column(
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
                                    InkWell(
                                      child: Container(
                                        width: 150,
                                        height: 35,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(5)),
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
                          ]
                        ),
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
                          children: [
                            Text('Column 1'),
                            Text('Column 1'),
                            Text('Column 1'),
                            Text('Column 1'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Column 2'),
                            Text('Column 2'),
                            Text('Column 2'),
                            Text('Column 2'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Column 3'),
                            Text('Column 3'),
                            Text('Column 3'),
                            Text('Column 3'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
