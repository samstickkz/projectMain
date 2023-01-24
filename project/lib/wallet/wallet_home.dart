import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/glass.dart';

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
            GlassPage(),

            ///purple container

          ],

        ),
      ),
    );
  }
}
