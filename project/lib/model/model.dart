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
