import 'package:flutter/material.dart';
import 'package:qims_mobile/share/custom_button.dart';
import 'package:qims_mobile/share/custom_form_field.dart';
import 'package:qims_mobile/share/custom_routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Login',
                style: TextStyle(fontSize: 30),
              ),
              Text('Silahkan masukkan username dan password'),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                title: 'Username',
                icon: Icon(Icons.person),
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormField(
                title: 'Password',
                icon: Icon(Icons.vpn_key),
                suffixIcon: Icon(Icons.visibility),
                obsecureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Submit',
                onKlick: () {
                  Navigator.pushNamedAndRemoveUntil(context, CustomRoutes.menu, (Route<dynamic> route) => false);
                }
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
                        Navigator.pushNamed(context, CustomRoutes.registerPage);
                      },
                      child: Text('Daftar'),
                    ),
                    alignment: Alignment.bottomLeft,
                  )
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

}
