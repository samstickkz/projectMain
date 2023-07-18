import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project/onboarding/main_onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/login_main_to_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  runApp(MyApp(email: email)); // Pass the email to the MyApp widget
}

class MyApp extends StatelessWidget {
  final String? email; // Declare the email variable in the MyApp class

  const MyApp({Key? key, this.email}) : super(key: key); // Use Key instead of super.key

  // ...

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.deepPurpleAccent.shade200,
            ),
          ),
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
        );
      },
    );
  }
}
