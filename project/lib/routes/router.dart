import 'package:flutter/material.dart';
import 'package:project/routes/routes.dart';
import 'package:project/ui/onboarding/onboarding.ui.dart';

import '../onboarding/main_onboarding.dart';
import '../ui/splash/spalsh_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
    // case HomeRoute:
    //   return MaterialPageRoute(builder: (_) => const BottomNavPage());
      case walletHomeRoute:
        return MaterialPageRoute(builder: (_) => const WalletHome());
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}