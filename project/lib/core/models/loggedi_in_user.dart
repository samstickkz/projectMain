class SaveUser {
  bool? isHidden;
  String? password;
  double? balance;
  String? phoneNumber;
  String? profilePhoto;
  String? walletAddress;
  String? uuid;
  String? email;
  String? token;
  String? name;
  String? appPassword;

  SaveUser(
      {this.isHidden,
        this.password,
        this.balance,
        this.phoneNumber,
        this.profilePhoto,
        this.walletAddress,
        this.uuid,
        this.email,
        this.token,
        this.name,
        this.appPassword});

  SaveUser.fromJson(Map<String, dynamic> json) {
    isHidden = json['isHidden'];
    password = json['password'];
    balance = json['balance'];
    phoneNumber = json['phoneNumber'];
    profilePhoto = json['profile_photo'];
    walletAddress = json['wallet_address'];
    uuid = json['uuid'];
    email = json['email'];
    token = json['token'];
    name = json['name'];
    appPassword = json['app_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isHidden'] = this.isHidden;
    data['password'] = this.password;
    data['balance'] = this.balance;
    data['phoneNumber'] = this.phoneNumber;
    data['profile_photo'] = this.profilePhoto;
    data['wallet_address'] = this.walletAddress;
    data['uuid'] = this.uuid;
    data['email'] = this.email;
    data['token'] = this.token;
    data['name'] = this.name;
    data['app_password'] = this.appPassword;
    return data;
  }
}
