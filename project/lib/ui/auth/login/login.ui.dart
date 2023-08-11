import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/ui/auth/register/register.dart';
import 'package:flutter/material.dart';
import '../../../button/login_button.dart';
import '../../../screens/nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('16171A'),
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'images/image 18.png',
                          height: 423,
                          width: 423,
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      const SizedBox(
                        height: 43.97,
                      ),

                      /// button
                      GestureDetector(onTap: () {}, child: const LoginButton()),

                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 331,
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                        ),
                      ),

                      const SizedBox(
                        height: 55,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Continue as',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NavPage(),
                                ),
                              );
                            },
                            child: Text(
                              'guest',
                              style: TextStyle(color: HexColor('9D62D9')),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
