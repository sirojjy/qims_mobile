import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? judul;

  const CustomAppBar({super.key, this.judul});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xff0CACFF),
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
          title: Text(
            '$judul',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Container(
              width: 50,
              child: Icon(Icons.person),
            )
          ],
        ),
        preferredSize: preferredSize);
  }
}