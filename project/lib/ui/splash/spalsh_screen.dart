import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/utils/widget_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes.dart';
import '../auth/login/login.ui.dart';
import '../../constants/reuseables.dart';
import '../../onboarding/main_onboarding.dart';
import '../onboarding/onboarding.ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key,}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? email;

  @override
  void initState() {
   init();
    super.initState();
  }

  init()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 2000,
        backgroundColor: Colors.black,
        splashTransition: SplashTransition.fadeTransition,
        splash: Center(
          child: Padding(
            padding: 62.0.padH,
            child: Column(
              children: [
                SvgPicture.asset(AppImages.logoFull, width: 300, fit: BoxFit.contain,),
              ],
            ),
          ),
        ),
        nextScreen: email == null ? const OnBoardingScreen() : const WalletHome(),
        // nextRoute: email == null ? onBoardingScreen :walletHomeRoute ,
      ),
    );
  }
}
