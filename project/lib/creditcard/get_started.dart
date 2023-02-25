import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/screens/second_route.dart';

import '../screens/login_register_page.dart';
import 'chip.dart';

class GlassPage extends StatefulWidget {
  const GlassPage({Key? key}) : super(key: key);

  @override
  State<GlassPage> createState() => _GlassPageState();
}

class _GlassPageState extends State<GlassPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///purple container
        Padding(
          padding: const EdgeInsets.only(top: 152.0, left: 30),
          child: Transform.rotate(
            angle: -69,
            child: Container(
              height: 302,
              width: 220,
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage('images/sam.JPG')
                  // ),

                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        HexColor('6262D9'),
                        HexColor('9D62D9'),
                      ])),
              child: const ChipPage(),
            ),
          ),
        ),

        /// transparent glass
        Padding(
          padding: const EdgeInsets.only(top: 44.0, left: 155),
          child: Transform.rotate(
            angle: -.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 302,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaY: 5,
                        sigmaX: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  HexColor('FFFFFF').withOpacity(0.1),
                                  HexColor('BEBEBE').withOpacity(0.1),
                                ])),
                        child: const ChipPage(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 535.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'Seamless trading',
                  style: TextStyle(
                    color: HexColor('D5D5E0'),
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'Buy, sell and exchange',
                  style: TextStyle(
                    color: HexColor('A7A7CC'),
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'cryptocurrencies.',
                  style: TextStyle(
                    color: HexColor('A7A7CC'),
                    fontSize: 22,
                  ),
                ),
              ),

              const SizedBox(
                height: 61,
              ),

              /// button
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage(),),
                    );
                  },
                  child: Container(
                    height: 54,
                    width: 327,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              HexColor('6262D9'),
                              HexColor('9D62D9'),
                            ])

                    ),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
