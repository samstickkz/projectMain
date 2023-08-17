
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/utils/snack_message.dart';

import '../../../constants/constants.dart';
import '../../../locator.dart';
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
    String tokens  = await storageService.readItem(key: accessToken);
    print("Access Token : $tokens");
  }

  Future<bool> register(String email, String password, String fullName)async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid??"";
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        "name": fullName,
        "email": email,
        "password": password,
        "uuid": uid,
        "token": "",
        "balance": 0.0,
        "phoneNumber": "",
        "wallet_address": "",
        "profile_photo": '',
        "isHidden": false,
        "app_password": ""
      });

      // Add provider information to the user's account data
      await _updateUserProviderInfo(userCredential.user!);

      return true;
    }catch(err){
      return false;
    }
  }

  Future<void> _updateUserProviderInfo(User user) async {
    await user.updateProfile(displayName: user.email);
    await user.reload();
  }

  Future<OAuthCredential> signinWithGoogle()async{
    try{
      print("Sign in with Google");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print(googleUser);
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      print(googleAuth);
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // print(credential);
      // await FirebaseAuth.instance.signInWithCredential(credential);
      return credential;
    }catch(err){
      rethrow;
    }
  }

  Future<SaveUser> signInWithEmailAndPassword(String email, String password) async{
    try{
      SaveUser user = SaveUser();

      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
      .then((value) async {
        String uid = value.user!.uid;

        print(uid);
        DocumentReference docRef = FirebaseFirestore.instance.collection('users').doc(uid);
        DocumentSnapshot<Object?> snapshot = await docRef.get();

        // Type cast the snapshot to DocumentSnapshot<Map<String, dynamic>>
        DocumentSnapshot<Map<String, dynamic>> typedSnapshot = snapshot as DocumentSnapshot<Map<String, dynamic>>;

        Map<String, dynamic> data = typedSnapshot.data() ?? {};

        print(jsonEncode(data));

        SaveUser responseData = SaveUser.fromJson(data);
        print(responseData.name);
        // user = responseData;

        print(user.email);
      }).catchError((err){
        showCustomToast(err.toString());
      });

      return user;
    }catch (err){
      rethrow;
    }
  }

  Future<UserCredential> signInWithCredential(OAuthCredential credential) async {
    try{
      UserCredential credentials = await FirebaseAuth.instance.signInWithCredential(credential);

      // Add provider information to the user's account data
      await _updateUserProviderInfo(credentials.user!);

      var user = SaveUser(
        name: credentials.user?.displayName,
        email: credentials.user?.email,
        phoneNumber: credentials.user?.phoneNumber,
        uuid: credentials.user?.uid,
        profilePhoto: credentials.user?.photoURL,
        token: credential.accessToken,
        isHidden: false
      );
      storeToken(credential.accessToken);
      await userService.storeUser(user);
      await locator<Initializer>().init();
      return credentials;
    }catch (err){
      rethrow;
    }
  }
}
