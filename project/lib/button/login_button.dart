import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/authentication/login_main.dart';

import '../wallet/wallet_dashboard.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
