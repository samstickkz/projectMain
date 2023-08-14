import 'dart:convert';

List<CryptoResponse> getCryptoPriceListFromJson(String str) =>
    List<CryptoResponse>.from(
        json.decode(str).map((x) => CryptoResponse.fromJson(x)));

class CryptoResponse {
  String? type;
  Values? values;

  CryptoResponse({this.type, this.values});

  CryptoResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    values =
    json['values'] != null ? new Values.fromJson(json['values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.values != null) {
      data['values'] = this.values!.toJson();
    }
    return data;
  }
}

class Values {
  double? usd;

  Values({this.usd});

  Values.fromJson(Map<String, dynamic> json) {
    usd = double.parse(json['usd'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usd'] = this.usd;
    return data;
  }
}
