import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project/onboarding/main_onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
      return GetMaterialApp(
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
            nextScreen: const WalletHome()),
      );
    }
    );
  }

}
