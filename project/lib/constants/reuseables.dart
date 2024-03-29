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

var onBoarding = {
  "data": [
    {
      "content": "Spend, save, and send money securely",
      "svg": AppImages.wallet
    },
    {
      "content": "Take charge of your finances now",
      "svg": AppImages.growth
    },
    {
      "content": "Pay for anything on the go with crypto",
      "svg": AppImages.cards
    }
  ]
};

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
  static const String logo = "assets/svg/currxchange.svg";
  static const String logoFull = "assets/svg/curry_full.svg";
  static const String pen = "assets/svg/edit_pen.svg";
  static const String twoFa = "assets/svg/2fa.svg";
  static const String delete = "assets/svg/bin.svg";
  static const String stars = "assets/svg/star.svg";
  static const String theme = "assets/svg/change_theme_icon.svg";
  static const String dollarBag = "assets/svg/dollar_money_bag.svg";
  static const String language = "assets/svg/language.svg";
  static const String logoutIcon = "assets/svg/logout_icon.svg";
  static const String passwordIcon = "assets/svg/passwordIcon.svg";
  static const String paymentIcon = "assets/svg/pay_account.svg";
  static const String pushNotification = "assets/svg/push_notification.svg";
  static const String referralIcon = "assets/svg/referral_icon.svg";
  static const String resetPassword = "assets/svg/reset_password.svg";
  static const String supportIcon = "assets/svg/support_icon.svg";
  static const String verificationIcon = "assets/svg/verification_icon.svg";
  static const String cards = "assets/image/card.png";
  static const String dollarBags = "assets/image/dollar.png";
  static const String wallet = "assets/image/wallet.png";
  static const String growth = "assets/image/grow.png";
}

class UrlPath {
  static const String signup = 'user/create-user';
  static const String login = 'auth/login';
  static const String user = 'auth/user/';
}
