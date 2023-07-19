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
  var namaCpController = TextEditingController();
  var namaKlienController = TextEditingController();
  var alamatController= TextEditingController();
  var emailController = TextEditingController();
  String message1 = '';
  String message2 = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc,AuthState>(
        listener: (context, state) {
           if (state.status.isSuccessRegister){
             Navigator.pushNamed(context, CustomRoutes.loginPage);
           }
        },
      child: Scaffold(
          body: SingleChildScrollView(
            child: Background(
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state){
                    if(state.status.isSuccess){
                      Navigator.pushNamedAndRemoveUntil(context, CustomRoutes.menu, (Route<dynamic> route) => false);
                    }
                  },
                  builder: (context, state){
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          const SizedBox(height: 30,),
                          SizedBox(
                            height: 100,
                            width: 330,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                  "assets/images/logo.png",
                                  width: size.width * 0.3
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0CACFF),
                                fontSize: 36,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),

                          SizedBox(height: size.height * 0.02),

                          state.status.isError ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              state.message ?? '',
                              style: const TextStyle(
                                color:  Colors.red,
                              ),
                            ),
                          ): const SizedBox(),

                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Nama Klien'
                              ),
                              controller: namaCpController,
                            ),
                          ),

                          SizedBox(height: size.height * 0.02),

                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Username'
                              ),
                              controller: userNameControler,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),

                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Password'
                              ),
                              controller: passwordController,
                              obscureText: true,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),

                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Nama Klien'
                              ),
                              controller: namaKlienController,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),

                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Alamat'
                              ),
                              controller: alamatController,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),

                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Email'
                              ),
                              controller: emailController,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),

                          SizedBox(height: size.height * 0.02),

                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                // print('hello');
                                context.read<AuthBloc>().add(OnRegisterEvent(
                                  param: 'register',
                                  nama_cp: namaCpController.text,
                                  username: userNameControler.text,
                                  password: passwordController.text,
                                  nama_klien: namaKlienController.text,
                                  alamat: alamatController.text,
                                  email: emailController.text,
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

                          SizedBox(height: size.height * 0.01),

                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
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
                          ),
                          const SizedBox(height: 30,)
                        ],
                      ),
                    );
                  },
                )
            ),
          )
      ),
    );
  }
}