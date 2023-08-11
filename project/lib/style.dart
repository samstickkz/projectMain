
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

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
  static  Color btncolor = HexColor('#FF9933');

  //card height
  static const double cardHeight = 70;
}

//class for card with all properties of the card
class CardModel {
  final String title;
  final String subtitle;
  final String amount;
  final String icon;
  final Color color;

  CardModel(
      {required this.title,
      required this.subtitle,
      required this.amount,
      required this.icon,
      required this.color});
}


