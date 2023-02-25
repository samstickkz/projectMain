import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../screens/home_page.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage,}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void dispose(){
    _passwordcontroller.dispose();
    _emailcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()) );
                      },
                      child: Container(
                        height: 41,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: HexColor('E8ECF4'))
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28,),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Welcome Boss! Glad', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                        Text('Sign Up Now!', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 32,),

                TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('F7F8F9'),
                    filled: true,

                    labelText: 'Enter  email',
                    border: const OutlineInputBorder(
                    ),
                  ),

                ),

                const SizedBox(height: 15,),


                TextField(
                  obscureText: true ,
                  controller: _passwordcontroller,

                  decoration: InputDecoration(
                    fillColor: HexColor('F7F8F9'),
                    filled: true,

                    labelText: 'Enter your password',
                    border: const OutlineInputBorder(

                    ),
                    suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                  ),

                ),
                const SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?', style: TextStyle(
                      color: HexColor('6A707C'),
                    ),),
                  ],
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: HexColor('1E232C'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
