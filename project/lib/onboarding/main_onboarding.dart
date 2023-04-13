import 'package:project/onboarding/get_started.dart';
import 'package:flutter/material.dart';
import 'dart:ui';


class WalletHome extends StatefulWidget {
  const WalletHome({Key? key}) : super(key: key);

  @override
  State<WalletHome> createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(

        child: Stack(
          children: [
            BackdropFilter(filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            )),
            const GlassPage(),

          ],

        ),
      ),
    );
  }
}
