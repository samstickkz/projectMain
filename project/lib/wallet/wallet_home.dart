import 'package:flutter/material.dart';

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
      body: Column(
        children:  [
          Container(
            child: Container(
              decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors:  <Color>[
                   Color(0xff1f005c),
                   Color(0xff5b0060),
                   Color(0xff870160),
                   Color(0xffac255e),
                   Color(0xffca485c),
                   Color(0xffe16b5c),
                   Color(0xfff39060),
                   Color(0xffffb56b),
                 ],
               )
              ),
              child: Column(
                children: [

                  ///home
                  Row(
                    children: const [
                      Icon(Icons.menu),
                    ],
                  ),

                  const Text('Home'),

                  ///your balance text
                  Row(),
                  ///your balance
                  Row(),
                  ///top up bottons
                  Row(),
                ],
              ),
            ),

          ),

        ],
      ),
    );
  }
}
