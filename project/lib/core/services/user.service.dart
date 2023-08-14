import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/core/models/loggedi_in_user.dart';
import 'package:project/core/models/loggedi_in_user.dart';
import 'package:project/core/models/loggedi_in_user.dart';
import '../../constants/constants.dart';
import '../../locator.dart';
import 'storage-service.dart';


class UserService {
  late Locale myLocale;
  SaveUser userCredentials = SaveUser();
  StorageService storageService = locator<StorageService>();
  bool? _token;
  String userType = "";

  //get the user object
  getLocalUser({SaveUser? user}) async {
    print(userCredentials.email);
    if (user != null) {
      userCredentials = user;
    } else {
      String? userVal = await storageService.readItem(key: currentUser);
      if(userVal == null || userVal == "null"){

      }else{
        userCredentials = SaveUser.fromJson(jsonDecode(userVal));
      }
    }
    String? value = await storageService.readItem(key: token);

    _token = value != null ? true : false;
  }

  storeUser(SaveUser? response) async {
    print("store user");
    await getLocalUser(user: response);
    storageService.storeItem(
        key: currentUser,
        value: jsonEncode(response));
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
    userCredentials = SaveUser();
    _token = null;
  }
}
