import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class ButtonF extends StatefulWidget {
  const ButtonF({Key? key}) : super(key: key);

  @override
  State<ButtonF> createState() => _ButtonFState();
}

class _ButtonFState extends State<ButtonF> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
    );
  }
}
