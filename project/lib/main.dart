import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';
import 'package:project/onboarding/main_onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/routes/router.dart';
import 'package:project/routes/routes.dart';
import 'package:project/styles/app_style.dart';
import 'package:project/ui/splash/spalsh_screen.dart';
import 'package:project/utils/widget_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/initializer.dart';
import 'ui/auth/login/login.ui.dart';
import 'constants/reuseables.dart';
import 'core/services/navigation_services.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase initialization error: $e');
    // Handle the error gracefully, you might want to show an error screen
    // or fallback behavior to the user.
  }

  // Use environment variable
  await dotenv.load(fileName: ".env");

  // set up locator services
  setupLocator();

  await locator<Initializer>().init();

  // Change status bar theme based on theme of app
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp()); // Pass the email to the MyApp widget
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key); // Use Key instead of super.key


  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: const Size(395, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            navigatorKey: locator<NavigationService>().navigatorKey,
            scaffoldMessengerKey: locator<NavigationService>().snackBarKey,
            theme: Style.darkTheme(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routers.generateRoute,
            initialRoute: splashScreenRoute,
            navigatorObservers: [FlutterSmartDialog.observer],
            // here
            builder: FlutterSmartDialog.init(),
          );
        },
      ),
    );
  }
}