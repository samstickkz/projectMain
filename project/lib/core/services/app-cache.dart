import 'dart:io';

import '../../locator.dart';
import 'storage-service.dart';

class AppCache {
  // AgentProfileResponse userCredentials = AgentProfileResponse();
  StorageService storageService = locator<StorageService>();

  String? accountType;
  String? profileGroup;
  String? token;
  String? fName;
  String? lName;
  String? email;
  String? userID;
  String? type;
  String? url;
  String? otp;
  String? navigationFor;
  String? password;
  String? confirmPassword;
  String? businessName;
  String? businessEmail;
  String? businessService;
  String? cacNumber;
  String? expertField;

  String? comingFrom;

  clearRegisterData(){
    accountType = null;
    profileGroup = null;
    type = null;
    fName = null;
    lName = null;
    url = null;
    token = null;
    userID = null;
    businessName = null;
    businessEmail = null;
    businessService = null;
    cacNumber = null;
    email = null;
    otp = null;
    password = null;
    confirmPassword = null;
  }

  bool? firstTimeKYC;

  
  String? dateOfBirth;
  File? userImage;

  String? rentCost;
  String? contractType;

}
