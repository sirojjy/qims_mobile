import 'package:flutter/material.dart';
import 'package:qims_mobile/aut_modul/ui/screen/register.dart';
import 'package:qims_mobile/share/custom_routes.dart';

import 'background.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal:40),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0CACFF),
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: size.height * 0.03,),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Username'
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03,),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2661FA)
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03,),

              Container(

                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, CustomRoutes.menu, (Route<dynamic> route) => false);
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
                        'Login',
                        style:
                        TextStyle(fontSize: 20,),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()))
                  },
                  child: const Text(
                    "Don't Have an Account? Sign up",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)
                    ),
                  ),
                ),
              )

            ],
          ),
        )
      )
      // Stack(
      //   children: [
      //     SafeArea(
      //       child: Scaffold(
      //         body: Container(
      //           padding: EdgeInsets.only(left: 15, right: 15),
      //           child: Column(
      //             children: [
      //               SizedBox(
      //                 height: 100,
      //               ),
      //               Text(
      //                 'Login',
      //                 style: TextStyle(fontSize: 30),
      //               ),
      //               Text('Silahkan masukkan username dan password'),
      //               SizedBox(
      //                 height: 20,
      //               ),
      //               CustomFormField(
      //                 title: 'Username',
      //                 icon: Icon(Icons.person),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               CustomFormField(
      //                 title: 'Password',
      //                 icon: Icon(Icons.vpn_key),
      //                 suffixIcon: Icon(Icons.visibility),
      //                 obsecureText: true,
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               CustomButton(
      //                   text: 'Submit',
      //                   onKlick: () {
      //                     Navigator.pushNamedAndRemoveUntil(
      //                         context,
      //                         CustomRoutes.menu,
      //                             (Route<dynamic> route) => false);
      //                   }),
      //               Expanded(child: SizedBox()),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Align(
      //                     child: Text('Belum punya akun? '),
      //                     alignment: Alignment.bottomRight,
      //                   ),
      //                   Align(
      //                     child: GestureDetector(
      //                       onTap: () {
      //                         Navigator.pushNamed(
      //                             context, CustomRoutes.registerPage);
      //                       },
      //                       child: Text('Daftar'),
      //                     ),
      //                     alignment: Alignment.bottomLeft,
      //                   )
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

