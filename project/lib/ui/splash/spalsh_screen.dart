import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/utils/widget_extensions.dart';

import '../auth/login/login.ui.dart';
import '../../constants/reuseables.dart';
import '../../onboarding/main_onboarding.dart';

class SplashScreen extends StatelessWidget {
  final String? email;
  const SplashScreen({Key? key, required this.email}) : super(key: key);

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
        nextScreen: email == null ? const LoginPage() : const WalletHome(),
      ),
    );
  }
}
