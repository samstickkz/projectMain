import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/routes/routes.dart';
import 'package:project/ui/base.vm.dart';
import 'package:project/utils/snack_message.dart';

class LoginViewModel extends BaseViewModel{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loginCheck()async{
    if(formKey.currentState?.validate()?? false){
      await login();
    }
  }

  // fixes made

  resetPassword(){
    navigationService.navigateTo(resetPasswordRoute);
  }

  register(){
    navigationService.navigateTo(registerRoute);
  }

  Future<OAuthCredential?> signInWithGoogle() async {
    startLoader();
    try{
      OAuthCredential? response = await authApi.signinWithGoogle();
      stopLoader();
      // await signInWithCredential(response);
      notifyListeners();
      return response;
    }catch(err){
      stopLoader();
      notifyListeners();
      return null;
    }
  }

  // Future<UserCredential?> signInWithCredential(OAuthCredential credential) async {
  //   startLoader();
  //   try{
  //     UserCredential response = await authApi.signInWithCredential(credential);
  //     stopLoader();
  //     showCustomToast("Login Successful", success: true);
  //     navigationService.navigateToAndRemoveUntil(bottomNavigationRoute);
  //     notifyListeners();
  //     return response;
  //   }catch(err){
  //     stopLoader();
  //     notifyListeners();
  //     return null;
  //   }
  // }

  Future<void> login() async {

    try {
      startLoader();
      var response = await authApi.signInWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim()).then((value) => print(value.email));
      stopLoader();
      notifyListeners();


      // Get.to(() => const NavPage());
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      if (e.code == 'user-not-found') {
        notifyListeners();
        stopLoader();
        showCustomToast('Egbon, goan create an account joh.');
      } else if (e.code == 'wrong-password') {
        notifyListeners();
        stopLoader();
        showCustomToast('shey you no know your password ni ?');
      } else {
        stopLoader();
        notifyListeners();
        showCustomToast(e.message??"");
      }
    } catch (e) {
      notifyListeners();
      stopLoader();
      showCustomToast(e.toString());
    }
  }

}