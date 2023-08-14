class SaveUser {
  String? name;
  String? email;
  String? phoneNumber;
  String? uuid;
  String? profilePhoto;
  String? token;
  String? refreshToken;
  bool? isHidden;

  SaveUser({this.name, this.email, this.phoneNumber, this.uuid, this.profilePhoto, this.token, this.refreshToken, this.isHidden});

  SaveUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    uuid = json['uuid'];
    profilePhoto = json['profilePhoto'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    isHidden = json['isHidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['uuid'] = this.uuid;
    data['profilePhoto'] = this.profilePhoto;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    data['isHidden'] = this.isHidden;
    return data;
  }
}