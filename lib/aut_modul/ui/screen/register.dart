import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/aut_modul/ui/screen/background.dart';
import 'package:qims_mobile/aut_modul/ui/screen/login.dart';
import 'package:qims_mobile/share/custom_routes.dart';

import '../bloc/auth_bloc.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var userNameControler = TextEditingController();
  var passwordController = TextEditingController();
  var namaController = TextEditingController();
  String message1 = '';
  String message2 = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Background(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state){
                  if(state.status.isSuccess){
                    Navigator.pushNamedAndRemoveUntil(context, CustomRoutes.menu, (Route<dynamic> route) => false);
                  }
                },
                builder: (context, state){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0CACFF),
                            fontSize: 36,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      state.status.isError ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        state.message ?? '',
                        style: const TextStyle(
                          color:  Colors.red,
                        ),
                      ),
                      ): SizedBox(),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Nama Klien'
                          ),
                          controller: namaController,
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Username'
                          ),
                          controller: userNameControler,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Password'
                          ),
                          controller: passwordController,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),

                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.symmetric(horizontal: 40),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //         labelText: 'Nomor HP'
                      //     ),
                      //   ),
                      // ),
                      //
                      // SizedBox(height: size.height * 0.03),
                      //
                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.symmetric(horizontal: 40),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //         labelText: 'Email'
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: size.height * 0.03),

                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            print('hello');
                            context.read<AuthBloc>().add(OnRegisterEvent(
                              param: 'register',
                              nama: namaController.text,
                              username: userNameControler.text,
                              password: passwordController.text,
                            ));
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
                                'Register',
                                style:
                                TextStyle(fontSize: 20,),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),


                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                          },
                          child: const Text(
                            "Already Have an Account? Login",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2661FA)
                            ),
                          ),
                        ),
                      )

                    ],
                  );
                },
              )
          ),
        )
    );
  }
}



// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     return
//       SafeArea(
//         child: Scaffold(
//           body: Container(
//             padding: EdgeInsets.only(left: 15, right: 15),
//             child: Column(
//               children: [
//                 Wrap(
//                   spacing: 10,
//                   children: [
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Text(
//                       'Daftar',
//                       style: TextStyle(fontSize: 30),
//                     ),
//                     Text('Silahkan isi form pendaftaran'),
//                     SizedBox(height: 10,),
//                     CustomFormField(
//                       title: 'Nama Klien',
//                     ),
//                     SizedBox(height: 10,),
//                     CustomFormField(
//                       title: 'Alamat',
//                     ),
//                     SizedBox(height: 10,),
//                     CustomFormField(
//                       title: 'Nama PIC',
//                     ),
//                     SizedBox(height: 10,),
//                     CustomFormField(
//                       title: 'No. HP',
//                     ),
//                     SizedBox(height: 10,),
//                     CustomFormField(
//                       title: 'Email',
//                     ),
//                     SizedBox(height: 10,),
//                     CustomButton(
//                       text: 'Daftar',
//                       onKlick: () {},
//                     ),
//                     Expanded(child: SizedBox()),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Align(
//                           child: Text('Belum punya akun? '),
//                           alignment: Alignment.bottomRight,
//                         ),
//
//                         Align(
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, CustomRoutes.loginPage);
//                             },
//                             child: Text('Login'),
//                           ),
//                           alignment: Alignment.bottomLeft,
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 10,)
//                   ],
//                 )
//               ],
//             ),
//
//           ),
//         )
//     );
//   }
// }
