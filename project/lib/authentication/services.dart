import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class authService{
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
      return credentials;
    }catch (err){
      rethrow;
    }
  }
}