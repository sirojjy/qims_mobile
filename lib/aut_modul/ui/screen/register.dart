import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_button.dart';
import 'package:qims_mobile/share/custom_form_field.dart';
import 'package:qims_mobile/share/custom_routes.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                    'Daftar',
                  style: TextStyle(fontSize: 30),
                ),
                Text('Silahkan isi form pendaftaran'),
                SizedBox(height: 10,),
                CustomFormField(
                  title: 'Nama Klien',
                ),
                SizedBox(height: 10,),
                CustomFormField(
                  title: 'Alamat',
                ),
                SizedBox(height: 10,),
                CustomFormField(
                  title: 'Nama PIC',
                ),
                SizedBox(height: 10,),
                CustomFormField(
                  title: 'No. HP',
                ),
                SizedBox(height: 10,),
                CustomFormField(
                  title: 'Email',
                ),
                SizedBox(height: 10,),
                CustomButton(
                  text: 'Daftar',
                  onKlick: () {},
                ),
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text('Belum punya akun? '),
                      alignment: Alignment.bottomRight,
                    ),

                    Align(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CustomRoutes.loginPage);
                        },
                        child: Text('Login'),
                      ),
                      alignment: Alignment.bottomLeft,
                    )
                  ],
                ),
                SizedBox(height: 10,)
              ],
            ),

          ),
        )
    );
  }
}
