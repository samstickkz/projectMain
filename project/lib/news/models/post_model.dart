// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
//
// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Welcome {
//   int albumId;
//   int id;
//   String title;
//   String url;
//   String thumbnailUrl;
//
//   Welcome({
//     required this.albumId,
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.thumbnailUrl,
//   });
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//     albumId: json["albumId"],
//     id: json["id"],
//     title: json["title"],
//     url: json["url"],
//     thumbnailUrl: json["thumbnailUrl"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "albumId": albumId,
//     "id": id,
//     "title": title,
//     "url": url,
//     "thumbnailUrl": thumbnailUrl,
//   };
// }


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Datum> data;
  Status status;

  Welcome({
    required this.data,
    required this.status,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status.toJson(),
  };
}

class Datum {
  int id;
  int rank;
  String name;
  String symbol;
  String slug;
  int isActive;
  DateTime firstHistoricalData;
  DateTime lastHistoricalData;
  Platform? platform;

  Datum({
    required this.id,
    required this.rank,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.isActive,
    required this.firstHistoricalData,
    required this.lastHistoricalData,
    this.platform,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    rank: json["rank"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    isActive: json["is_active"],
    firstHistoricalData: DateTime.parse(json["first_historical_data"]),
    lastHistoricalData: DateTime.parse(json["last_historical_data"]),
    platform: json["platform"] == null ? null : Platform.fromJson(json["platform"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rank": rank,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "is_active": isActive,
    "first_historical_data": firstHistoricalData.toIso8601String(),
    "last_historical_data": lastHistoricalData.toIso8601String(),
    "platform": platform?.toJson(),
  };
}

class Platform {
  int id;
  String name;
  String symbol;
  String slug;
  String tokenAddress;

  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    tokenAddress: json["token_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "token_address": tokenAddress,
  };
}

class Status {
  DateTime timestamp;
  int errorCode;
  String errorMessage;
  int elapsed;
  int creditCount;

  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    timestamp: DateTime.parse(json["timestamp"]),
    errorCode: json["error_code"],
    errorMessage: json["error_message"],
    elapsed: json["elapsed"],
    creditCount: json["credit_count"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "error_code": errorCode,
    "error_message": errorMessage,
    "elapsed": elapsed,
    "credit_count": creditCount,
  };
}
