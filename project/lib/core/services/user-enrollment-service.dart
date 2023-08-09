import 'dart:io';

import '../../locator.dart';
import 'storage-service.dart';

class UserEnrollmentService {
  // AgentProfileResponse userCredentials = AgentProfileResponse();
  StorageService storageService = locator<StorageService>();

  String? accountType;
  String? phoneNumber;
  String? fName;
  String? id;
  String? lName;
  String? email;
  String? dateOfBirth;
  File? userImage;

  // EnrollUserResponse enrollUserResponse = EnrollUserResponse();
}
