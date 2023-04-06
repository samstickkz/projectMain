import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

import 'package:project/onboarding/main_onboarding.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.deepPurpleAccent.shade200,
      )),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          splash: Center(
            child: Column(
              children: const [
                Icon(Icons.home),
              ],
            ),
          ),
          // nextScreen: WalletHome()),
          nextScreen: const WalletHome()),
    );
  }
}
