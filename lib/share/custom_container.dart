import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Icon icon;
  final String? text1;
  final String? text2;
  final Color? color;
  const CustomContainer({Key? key, required this.icon, this.text1, this.text2, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          color: color,
          child: Column(
            children: [
              icon,
              Text(
                '$text1',
                style: TextStyle(fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text('$text2'),
            ],
          ),
        )
    );
  }
}
