import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_appbar.dart';
import '../../../share/custom_routes.dart';

class ProfilClient extends StatefulWidget {
  const ProfilClient({Key? key}) : super(key: key);

  @override
  State<ProfilClient> createState() => _ProfilClientState();
}

class _ProfilClientState extends State<ProfilClient> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: const CustomAppBar(
              judul: 'Profil',
            ),
            body: SingleChildScrollView(
              child:  Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: const Text(
                          'Ubah Profil',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0CACFF),
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: 'Nama Klien'
                          ),
                          
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: 'Alamat'
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: 'Nama PIC'
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: 'Nomor HP'
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: 'Email'
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      Container(

                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            final snackBar = SnackBar(
                                content: Text('Berhasil disimpan'),
                              action: SnackBarAction(
                                label: '',
                                onPressed: (){},
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient:
                                const LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: 150,
                              height: 40,
                              alignment: Alignment.center,
                              child: const Text(
                                'Simpan',
                                style:
                                TextStyle(fontSize: 20,),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.06),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            backgroundColor: Colors.red,
                          ),
  
                          child: Text(
                              'Logout',
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:  const Text('Konfirmasi'),
                              content: const Text('Apakah anda yakin ingin keluar?'),
                              actions: <Widget>[
                                TextButton(onPressed: () => Navigator.pop(context, 'Batal'), child: Text('Batal')),
                                TextButton(onPressed: (){
                                  Navigator.pushNamedAndRemoveUntil(context, CustomRoutes.loginPage, (Route<dynamic> route) => false);
                                }, child: Text('Ya')),
                              ],
                            )
                          ),
                        ),
                      ),

                    ],
                  )
              ),
            )
          ),
    );
  }
}
