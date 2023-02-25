import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/authentication/login.dart';

class ButtonF extends StatefulWidget {
  const ButtonF({Key? key}) : super(key: key);

  @override
  State<ButtonF> createState() => _ButtonFState();
}

class _ButtonFState extends State<ButtonF> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      // Within the `FirstRoute` widget
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage()) );
      },
      child: Container(
        width: 331,
        height: 56,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HexColor('6262D9'),
                  HexColor('9D62D9'),
                ]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
