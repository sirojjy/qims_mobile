import 'package:flutter/material.dart';
import 'package:qims_mobile/dashboard_client/ui/screen/profil_client.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? judul;

  const CustomAppBar({Key? key, this.judul}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff0CACFF),
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/images/logo_qai.jpg',
            scale: 1,
            // height: 10,
          ),
        ),
      ),
      title: Text(
        judul ?? 'Title',
        style: const TextStyle(fontSize: 18),
      ),
      actions: [
        SizedBox(
          width: 50,
          child: IconButton(
            icon: const Icon(Icons.person),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilClient()));
            },
          ),

        )
      ],
    );
  }
}