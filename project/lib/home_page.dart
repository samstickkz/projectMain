import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('images/bglogin.png'),
        Padding(
          padding: const EdgeInsets.only(top: 448.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'images/logo icon.png',
                  height: 58,
                  width: 58,
                ),

                SizedBox(
                  height: 8,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sam\'s',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      'flowry',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 43.97,
                ),

                /// buton
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()) );
                  },
                  child: Container(
                    width: 331,
                    height: 56,
                    decoration: BoxDecoration(
                      color: HexColor('1E232C'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 331,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      // color: HexColor('1E232C'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    )),
                  ),
                ),

                SizedBox(
                  height: 55,
                ),

                Text(
                  'Continue as guest',
                  style: TextStyle(
                    color: HexColor('35C2C1'),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
