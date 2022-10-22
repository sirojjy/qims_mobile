import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? judulCard;
  final String? namaISO;
  const CustomCard({Key? key, this.judulCard, this.namaISO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Text('$judulCard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
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
              SizedBox(
                width: 20,
              ),
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
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text("ISO 9001:2015"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(
                            'Scope : Provision of Management and Administration of Fish Diseases, Quality and Safety of Fishery Product'),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
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
    );
  }
}
