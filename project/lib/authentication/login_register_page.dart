import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/authentication/register.dart';
import '../button/login_button.dart';


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
            // Image.asset('images/bglogin.png'),
            Padding(
              padding: const EdgeInsets.only(top: 448.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/logobird.png',
                      height: 58,
                      width: 58,
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sam\'s',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Wallet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 43.97,
                    ),

                    /// buton
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
                                    builder: (context) => const RegisterPage()));
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
                        Text(
                          'guest',
                          style: TextStyle(color: HexColor('9D62D9')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
