import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/utils/snack_message.dart';

import '../../../constants/constants.dart';
import '../../../constants/reuseables.dart';
import '../../../locator.dart';
import '../../../routes/routes.dart';
import '../../models/loggedi_in_user.dart';
import '../initializer.dart';
import '../storage-service.dart';
import '../user.service.dart';

class AuthenticationApiService {
  StorageService storageService = locator<StorageService>();
  UserService userService = locator<UserService>();

  storeToken(String? token, {bool saveUser = true}) async {
    //store token
    storageService.storeItem(key: accessToken, value: token);
    String tokens = await storageService.readItem(key: accessToken);
    print("Access Token : $tokens");
  }

  Future<bool> register(String email, String password, String fullName) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid ?? "";
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        "name": fullName,
        "email": email,
        "password": password,
        "uuid": uid,
        "token": "",
        "balance": 0.0,
        "phoneNumber": "",
        "wallet_address": "",
        "profile_photo":
            'https://d1mjtvp3d1g20r.cloudfront.net/2022/08/22151848/52.png',
        "isHidden": false,
        "app_password": ""
      });

      // Add provider information to the user's account data
      await _updateUserProviderInfo(userCredential.user!);

      return true;
    } catch (err) {
      return false;
    }
  }

  Map<String, dynamic> filterNullValues(Map<String, dynamic> data) {
    Map<String, dynamic> filteredData = {};

    data.forEach((key, value) {
      if (value != null) {
        filteredData[key] = value;
      }
    });

    return filteredData;
  }

  Future<bool> updateUser(
      {String? name,
      String? email,
      String? password,
      String? uuid,
      String? token,
      int? balance,
      String? phoneNumber,
      String? wallet_address,
      int? profile_photo,
      bool? isHidden,
      String? app_password}) async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "uuid": uuid,
      "token": token,
      "balance": balance,
      "phoneNumber": phoneNumber,
      "wallet_address": wallet_address,
      "profile_photo": profile_photo,
      "isHidden": isHidden,
      "app_password": app_password
    };
    try {
      String? user = userService.userCredentials.uuid;
      Map<String, dynamic> filteredData = filterNullValues(data);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .update(filteredData);

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<void> _updateUserProviderInfo(User user) async {
    await user.updateProfile(displayName: user.email);
    await user.reload();
  }

  Future<SaveUser?> signinWithGoogle() async {
    try {
      print("Sign in with Google");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print(googleUser);
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      print(googleAuth);
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      SaveUser? user = await signInWithCredential(credential);
      // print(credential);
      // await FirebaseAuth.instance.signInWithCredential(credential);
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> updatePin(String pin, String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({"app_password": pin});
      return true;
    } catch (err) {
      showCustomToast("Error Message::: $err");
      return false;
    }
  }

  Future<SaveUser?> getUser() async {
    String? user = userService.userCredentials.uuid;
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('users').doc(user);
      DocumentSnapshot<Object?> snapshot = await docRef.get();

      // Type cast the snapshot to DocumentSnapshot<Map<String, dynamic>>
      DocumentSnapshot<Map<String, dynamic>> typedSnapshot =
          snapshot as DocumentSnapshot<Map<String, dynamic>>;

      Map<String, dynamic> data = typedSnapshot.data() ?? {};

      print(jsonEncode(data));

      SaveUser responseData = SaveUser.fromJson(data);
      userService.storeUser(responseData);
      return responseData;
    } catch (err) {
      showCustomToast("Error!! $err");
      return null;
    }
  }

  Future<SaveUser> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      SaveUser user = SaveUser();

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String uid = value.user!.uid;

        DocumentReference docRef =
            FirebaseFirestore.instance.collection('users').doc(uid);
        DocumentSnapshot<Object?> snapshot = await docRef.get();

        // Type cast the snapshot to DocumentSnapshot<Map<String, dynamic>>
        DocumentSnapshot<Map<String, dynamic>> typedSnapshot =
            snapshot as DocumentSnapshot<Map<String, dynamic>>;

        Map<String, dynamic> data = typedSnapshot.data() ?? {};

        print(jsonEncode(data));

        SaveUser responseData = SaveUser.fromJson(data);
        user = responseData;
        // if(user.appPassword==""||user.appPassword==null){
        //   navigationService.navigateTo(createPinRouteOne);
        // }else{
        //   await userService.storeUser(user);
        //   await storeToken(user.uuid);
        // }
      }).catchError((err) {
        showCustomToast(err.toString());
      });

      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<SaveUser?> signInWithCredential(OAuthCredential credential) async {
    try {
      UserCredential credentials =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Add provider information to the user's account data
      await _updateUserProviderInfo(credentials.user!);

      print(credentials.user?.uid);

      DocumentReference docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(credentials.user?.uid);
      DocumentSnapshot<Object?> snapshot = await docRef.get();

      // Type cast the snapshot to DocumentSnapshot<Map<String, dynamic>>
      DocumentSnapshot<Map<String, dynamic>> typedSnapshot =
          snapshot as DocumentSnapshot<Map<String, dynamic>>;

      Map<String, dynamic> data = typedSnapshot.data() ?? {};

      // print(data['name']);

      SaveUser? userData;

      if (data['name'] == null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credentials.user?.uid)
            .set({
          "name": credentials.user?.displayName,
          "email": credentials.user?.email,
          "password": credential.accessToken,
          "uuid": credentials.user?.uid,
          "token": "",
          "balance": 0.0,
          "phoneNumber": "",
          "wallet_address": "",
          "profile_photo":
              'https://d1mjtvp3d1g20r.cloudfront.net/2022/08/22151848/52.png',
          "isHidden": false,
          "app_password": ""
        }).then((value) {
          var data = {
            "name": credentials.user?.displayName,
            "email": credentials.user?.email,
            "password": credential.accessToken,
            "uuid": credentials.user?.uid,
            "token": "",
            "balance": 0.0,
            "phoneNumber": "",
            "wallet_address": "",
            "profile_photo":
                'https://d1mjtvp3d1g20r.cloudfront.net/2022/08/22151848/52.png',
            "isHidden": false,
            "app_password": ""
          };
          SaveUser user = SaveUser.fromJson(data);
          userData = user;
        }).catchError((error) {
          // Handle the error here
          print('An error occurred: $error');
        });
      }

      // storeToken(credential.accessToken);
      // await userService.storeUser(user);
      await locator<Initializer>().init();
      return userData;
    } catch (err) {
      rethrow;
    }
  }
}
