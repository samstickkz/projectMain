// To parse this JSON data, do
//
//     final beams = beamsFromJson(jsonString);

import 'dart:convert';

List<Beams> beamsFromJson(String str) => List<Beams>.from(json.decode(str).map((x) => Beams.fromJson(x)));

String beamsToJson(List<Beams> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Beams {
  int userId;
  int id;
  String title;
  String body;

  Beams({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Beams.fromJson(Map<String, dynamic> json) => Beams(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
