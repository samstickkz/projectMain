import 'package:flutter/material.dart';

import '../core/services/app-cache.dart';
import '../core/services/navigation_services.dart';
import '../core/services/user.service.dart';
import '../locator.dart';

enum ViewState {
  idle,
  busy
}

NavigationService navigationService = locator<NavigationService>();
UserService userService = locator<UserService>();
AppCache cache = locator<AppCache>();

class AppString {
  static const String login = 'Login';

}

class AppStyle {
  static const double padding = 20;
  static const double avatarRadius = 45;
  static const double avatarRadius2 = 25;
  // text color
  static const Color textColorWhite = Colors.white;
  // background color
  static const Color backgroundColor = Colors.black;
  // card color
  static const Color cardColor = Color(0xFF4A4A58);
  // primary color
  static const Color primaryColor = Color(0xFF4A4A58);

  //card height
  static const double cardHeight = 70;
}

class AppFontSizes {
  static double headingFontSize32 = 32.0;
  static double headingFontSize24 = 24.0;
  static double headingFontSize22 = 22.0;
  static double headingFontSize20 = 20.0;
  static double titleFontSize18 = 18.0;
  static double titleFontSize16 = 16.0;
  static double titleNormalSize14 = 14.0;
  static double textCaptionSize12 = 12.0;
  static double textCaptionSize10 = 10.0;
}

class Sized16Container extends StatelessWidget {
  final Widget? child;
  final Decoration? decoration;

  const Sized16Container({super.key, this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: child,
    );
  }
}

const emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[0-9])\w+");

class AppImages {
  static const String userLock = "assets/svg/user-lock.svg";
}

class UrlPath {
  static const String signup = 'user/create-user';
  static const String login = 'auth/login';
  static const String user = 'auth/user/';
}
