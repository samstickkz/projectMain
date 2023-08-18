import 'dart:io';

import 'package:project/core/models/loggedi_in_user.dart';

import '../../locator.dart';
import 'storage-service.dart';

class AppCache {
  // AgentProfileResponse userCredentials = AgentProfileResponse();
  StorageService storageService = locator<StorageService>();

  SaveUser user = SaveUser();

  clearRegisterData(){

  }

  bool? firstTimeKYC;

  
  String? dateOfBirth;
  File? userImage;

  String? rentCost;
  String? contractType;

}
