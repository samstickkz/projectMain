import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'login_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  // final VoidCallback showLoginPage;
  // const RegisterPage({Key? key, required this.showLoginPage,}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    _passwordcontroller.dispose();
    _emailcontroller.dispose();
    _confirmpasswordcontroller.dispose();

    super.dispose();
  }

  Future signUp() async {
    bool passwordconfirmed(){
      if (_passwordcontroller.text.trim() == _confirmpasswordcontroller.text.trim()){
        return true;
      }else{
        return false;
      }
    }

    if (passwordconfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );

    }




  }

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
                  height: 28,
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
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter  email',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter your password',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // confirm password

                TextField(
                  controller: _confirmpasswordcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter your password',
                    border: const OutlineInputBorder(),
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
                    child: Center(
                        child: GestureDetector(
                      onTap: signUp,
                      child: Text(
                        'Resgister',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                  ),
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
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/Google.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'SignUp with Google ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 180,
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        'click here to register ?',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
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
