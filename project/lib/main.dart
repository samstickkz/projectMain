import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oktoast/oktoast.dart';
import 'package:project/onboarding/main_onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/styles/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication/login_main_to_dashboard.dart';
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

  SharedPreferences prefs = await SharedPreferences.getInstance();

  // set up locator services
  setupLocator();

  // Change status bar theme based on theme of app
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  var email = prefs.getString("email");
  runApp(MyApp(email: email)); // Pass the email to the MyApp widget
}

class MyApp extends StatelessWidget {
  final String? email; // Declare the email variable in the MyApp class

  const MyApp({Key? key, this.email}) : super(key: key); // Use Key instead of super.key
  

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
              nextScreen: email == null ? const LoginPage() : const WalletHome(),
            ),
            navigatorObservers: [FlutterSmartDialog.observer],
            // here
            builder: FlutterSmartDialog.init(),
          );
        },
      ),
    );
  }
}
