import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/screens/login_register_page.dart';

class LoginPage extends StatefulWidget {
  // final VoidCallback showRegisterPage;
  // const LoginPage({Key? key, required this.showRegisterPage,}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _emailcontroller = TextEditingController();
  // final _passwordcontroller = TextEditingController();
  //
  // Future signIn() async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailcontroller.text.trim(),
  //       password: _passwordcontroller.text.trim()
  //   );
  //
  // }
  //
  // @override
  // void dispose(){
  //   super.dispose();
  //   _passwordcontroller.dispose();
  //   _emailcontroller.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('16171A'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Container(
                        height: 41,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: HexColor('E8ECF4'))),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 130,
                ),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome Boss! Glad',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        Text(
                          'to see you, Again!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 32,
                ),

                TextField(
                  // controller: _emailcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter  email',
                    border: const OutlineInputBorder(

                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextField(

                  obscureText: true,
                  // controller: _passwordcontroller,

                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter your password',
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  // onTap: signIn,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            HexColor('6262D9'),
                            HexColor('9D62D9'),
                          ]),

                      // color: HexColor('1E232C'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),

                // GestureDetector(
                //   // onTap: signIn,
                //   child: Container(
                //     width: double.infinity,
                //     height: 56,
                //     decoration: BoxDecoration(
                //
                //
                //       borderRadius: BorderRadius.circular(8),
                //       border: Border.all(
                //         color: Colors.deepPurpleAccent,
                //       )
                //     ),
                //     child:  Center(
                //         child: GestureDetector(
                //           // onTap: widget.showRegisterPage,
                //           child: Text(
                //             'register',
                //             style: TextStyle(color: Colors.black),
                //           ),
                //         )),
                //   ),
                // ),

                SizedBox(
                  height: 200,
                ),
                Row(


                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'click here to register ?',
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
