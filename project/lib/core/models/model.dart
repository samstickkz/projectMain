import 'package:flutter/material.dart';

class Welcome {
  bool successful;
  Data data;
  String message;

  Welcome({
    required this.successful,
    required this.data,
    required this.message,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      successful: json["successful"],
      data: Data.fromJson(json["data"]),
      message: json["message"],
    );
  }
}

class Data {
  String address;

  Data({
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      address: json["address"],
    );
  }
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