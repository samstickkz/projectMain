import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/locator.dart';
import 'package:project/ui/splash/nav.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../core/services/initializer.dart';
import '../../constants/reuseables.dart';
import '../home/bottom_navigation.ui.dart';
import '../onboarding/onboarding.ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
          nextScreen: const Navigations(),
          // nextRoute: email == null ? onBoardingScreen :walletHomeRoute ,
        ),
      ),
    );
  }
}
