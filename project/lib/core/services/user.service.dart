import 'dart:convert';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../locator.dart';
import 'storage-service.dart';

class User {
  String? profile;

  User({
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      profile: json["profile"],
    );
  }
}

class UserService {
  late Locale myLocale;
  User userCredentials = User();
  StorageService storageService = locator<StorageService>();
  bool? _token;
  String userType = "";

  //get the user object
  getLocalUser({User? user}) async {
    print(userCredentials.profile);
    if (user != null) {
      userCredentials = user;
    } else {
      String? userVal = await storageService.readItem(key: currentUser);
      if(userVal == null || userVal == "null"){

      }else{
        userCredentials = User.fromJson(jsonDecode(userVal));
      }
    }
    String? value = await storageService.readItem(key: token);

    _token = value != null ? true : false;
  }

  storeUser(User? response) async {
    print("store user");
    await getLocalUser(user: response);
    storageService.storeItem(
        key: currentUser,
        value: jsonEncode(response));
  }

  setUserType({String? type})async{
    storageService.storeItem(key: userTypeData, value: type);
    await getUserType();
  }

  getUserType()async{
    String? response = await storageService.readItem(key: userTypeData);
    userType = response??"";
    print(userType);
  }

  //check if a user has a token
  bool get hasToken => _token ?? false;

  //check if user is loggedIn and verified
  bool get isLoggedIn => hasToken;

  //check if user credentials was cleared meaning user logged out completely
  // bool get hasCredentials => userCredentials.email != null;

  //Save List of Notifications
  // NotificationsResponse notificationsResponse = NotificationsResponse();

  //clear all user credentials
  resetAllCredentials() {
    storageService.deleteItem(key: currentUser);
    storageService.deleteItem(key: token);
    userCredentials = User();
    _token = null;
  }
}
