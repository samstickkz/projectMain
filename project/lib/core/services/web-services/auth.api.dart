
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<UserCredential> signInWithCredential(OAuthCredential credential) async {
    try{
      UserCredential credentials = await FirebaseAuth.instance.signInWithCredential(credential);
      var user = SaveUser(
        name: credentials.user?.displayName,
        email: credentials.user?.email,
        phoneNumber: credentials.user?.phoneNumber,
        uuid: credentials.user?.uid,
        profilePhoto: credentials.user?.photoURL,
        token: credential.accessToken,
        refreshToken: credentials.user?.refreshToken,
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
