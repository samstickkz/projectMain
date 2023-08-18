import 'package:flutter/material.dart';
import 'package:project/core/services/app-cache.dart';
import 'package:project/locator.dart';
import 'package:project/routes/routes.dart';
import 'package:project/ui/onboarding/onboarding.ui.dart';

import '../authentication/reset_password.dart';
import '../onboarding/main_onboarding.dart';
import '../ui/auth/checkPin/check.pin.ui.dart';
import '../ui/auth/login/login.ui.dart';
import '../ui/auth/pin_code/create.pin.ui.dart';
import '../ui/auth/register/register.ui.dart';
import '../ui/home/bottom_navigation.ui.dart';
import '../ui/splash/spalsh_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final cache = locator<AppCache>();
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
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case bottomNavigationRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavigationScreen());
      case loginWithPinRoute:
        return MaterialPageRoute(builder: (_) => const CheckPinScreen());
      case createPinRouteOne:
        return MaterialPageRoute(builder: (_) => CreatePinScreen(
          user: cache.user,
        ));
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