import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qims_mobile/aut_modul/ui/bloc/auth_bloc.dart';
import 'package:qims_mobile/aut_modul/ui/screen/register.dart';
import 'package:qims_mobile/share/custom_routes.dart';


import 'background.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userNameControler = TextEditingController();
  var passwordController = TextEditingController();
  String message1 = '';
  String message2 = '';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Background(
              child: BlocConsumer<AuthBloc, AuthState> (
                listener: (context, state){
                  if(state.status.isSuccess){
                    Navigator.pushNamedAndRemoveUntil(context, CustomRoutes.menu, (Route<dynamic> route) => false);
                  }
                },
                builder: (context, state){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
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
                        padding: const EdgeInsets.symmetric(horizontal:40),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0CACFF),
                            fontSize: 36,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(height: 5,),
                      state.status.isError ? Padding(
                          padding: EdgeInsets.symmetric(horizontal:40),
                          child: Text(
                            state.message ?? '',
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ): SizedBox(),


                      SizedBox(height: size.height * 0.03,),

                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Username'
                          ),
                          controller: userNameControler,
                        ),
                      ),


                      SizedBox(height: size.height * 0.03,),

                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          controller: passwordController,
                        ),
                      ),


                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: const Text(
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
                        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(OnLoginEvent(
                              param: 'login',
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
                              child: state.status.isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()))
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
                  );
                },
              )
            )
        )

    );
  }


  //validasi login
  // void _validateLogin(String username, String password) {
  //   if (username == '' && password == '' ) {
  //     setState(() {
  //       message1= 'Username tidak boleh kosong';
  //       message2 = 'Password tidak boleh kosong';
  //     });
  //   } else if(username == '' ) {
  //     setState(() {
  //       message1= 'Username tidak boleh kosong';
  //     });
  //   } else if (password == '') {
  //     setState(() {
  //       message2= 'Password tidak boleh kosong';
  //     });
  //   } else {
  //   }
  // }
}




