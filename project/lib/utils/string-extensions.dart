import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

import '../constants/reuseables.dart';

const ext = 0;
final formatCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

//Formats the amount and returns a formatted amount
String formatPrice(String amount) {
  return formatCurrency.format(num.parse(amount)).toString();
}

TextStyle appStyle = const TextStyle(
  color: Color(0xFFF0E9E4),
  fontSize: 16,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w400,
);

extension StringCasingExtension on String {
  String? camelCase() => toBeginningOfSentenceCase(this);

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String? trimToken() => contains(":") ? split(":")[1].trim() : this;

  String? trimSpaces() => replaceAll(" ", "");
}

extension ImagePath on String {
  String get svg => 'assets/svg/$this.svg';

  String get png => 'assets/images/$this.png';

  String get jpg => 'assets/images/$this.jpg';
}

String decodeErrorMessage(Map map) {
  String? errorMessage = "";
  map.forEach((key, value) {
    errorMessage = "${errorMessage!}- ${map[key].toString().replaceAll("]", "").replaceAll("[", "")}\n";
  });
  return errorMessage!;
}

extension NumExtensions on int {
  num addPercentage(num v) => this + ((v / 100) * this);

  num getPercentage(num v) => ((v / 100) * this);
}

extension NumExtensionss on num {
  num addPercentage(num v) => this + ((v / 100) * this);

  num getPercentage(num v) => ((v / 100) * this);
}

void openUrl({String? url}) {
  launchUrl(Uri.parse("http://$url"));
}

void openMailApp({String? receiver, String? title, String? body}) {
  launchUrl(Uri.parse("mailto:$receiver?subject=$title&body=$body"));
}

String trimPhone(String? phone) {
  if (phone![4] == "0") {
    List v = phone.split("").toList();
    v.removeAt(4);
    return v.join("").toString();
  } else {
    return phone;
  }
}

String? Function(String?)? emailValidator = (String? val) {
  String validate = val!.replaceAll(RegExp(r"\s+"), "");
  if (validate.isEmpty ||
      !RegExp(emailRegex).hasMatch(validate)) {
    return 'Enter valid email';
  }
  return null; // Return null for valid input
};
