// To parse this JSON data, do
//
//     final team = teamFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Team> teamFromJson(String str) =>
    List<Team>.from(json.decode(str).map((x) => Team.fromJson(x)));

String teamToJson(List<Team> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Team {
  String id;
  String symbol;
  String name;
  double currentPrice;

  Team({
    required this.id,
    required this.symbol,
    required this.name,
    required this.currentPrice,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        currentPrice: json["current_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
      };
}

class Roi {
  double times;
  Currency currency;
  double percentage;

  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  factory Roi.fromJson(Map<String, dynamic> json) => Roi(
        times: json["times"]?.toDouble(),
        currency: currencyValues.map[json["currency"]]!,
        percentage: json["percentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "times": times,
        "currency": currencyValues.reverse[currency],
        "percentage": percentage,
      };
}

enum Currency { BTC, USD, ETH }

final currencyValues =
    EnumValues({"btc": Currency.BTC, "eth": Currency.ETH, "usd": Currency.USD});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
