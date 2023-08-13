import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/palette.dart';

class Style {
  static ThemeData darkTheme (){
    return ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.black,
        indicatorColor: const Color(0xff0E1D36),
        // buttonColor: const Color.fromRGBO(0, 100, 229, 1),
        hintColor: const Color(0xff280C0B),
        highlightColor: primaryColor.withOpacity(0.3),
        hoverColor: const Color(0xff3A3A3B),
        focusColor: const Color(0xff0B2512),
        splashColor: primaryColor.withOpacity(0.2),
        disabledColor: Colors.grey,
        cardColor: Colors.black,
        canvasColor:  Colors.black,
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400
          ),
          titleLarge: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700
          ),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400
          ),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.grey.withOpacity(0.5), ),
        buttonTheme: ButtonThemeData(
            disabledColor: Colors.grey,
            focusColor: const Color(0xFF0064E5),
            highlightColor: AppColors.main,
            height: 55,
            colorScheme: const ColorScheme.light(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
        ),
        appBarTheme:  AppBarTheme(
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: Colors.transparent,
          foregroundColor: AppColors.white,
          iconTheme: IconThemeData(color: Colors.grey.shade100),
        ),
        // scaffoldBackgroundColor:  const Color.fromRGBO(20, 20, 20, 1),
        shadowColor: Colors.grey,

      // Theme.of(context).buttonTheme.copyWith(
      //     colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()),

    );
  }
}