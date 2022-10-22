
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  // final Icons icon;
  final IconData? icon;
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  const CustomContainer({Key? key, this.text1, this.text2,  required, this.icon, this.color1, this.color2 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          // padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),

            // color: color1,
            // color: color2,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          child:
          Column(
            children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: <Color>[
                          color1!, color2!,
                        ]
                    ),
                  ),
                  width: double.infinity,
                  height: 70,
                  child:
                  Icon(icon, color: Colors.white,size: 50,),
                ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                  color: Colors.white,
                ),
                height: 40,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$text1',
                      style: TextStyle(fontSize: 14,
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('$text2',
                      style: TextStyle(
                          fontSize: 14,
                          // color: Colors.white
                      ),
                    ),
                  ],
                )
                ,
              )

            ],
          ),
        )
    );
  }
}
