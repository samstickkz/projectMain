import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/core/models/loggedi_in_user.dart';
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

  Future<SaveUser?> signInWithGoogle() async {
    startLoader();
    try{
      SaveUser? response = await authApi.signinWithGoogle();
      stopLoader();
      if(response?.appPassword==""||response?.appPassword==null){
        appCache.user = response??SaveUser();
        print("""here""");
        await navigationService.navigateToAndRemoveUntil(createPinRouteOne);
      }
      await userService.storeUser(response);
      await authApi.storeToken(response?.uuid);
      stopLoader();
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
      var response = await authApi.signInWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
      if(response.appPassword==""||response.appPassword==null){
        appCache.user = response;
        print("""here""");
        await navigationService.navigateToAndRemoveUntil(createPinRouteOne);
      }
      await userService.storeUser(response);
      await authApi.storeToken(response.uuid);
      stopLoader();
      showCustomToast("Login Successful", success: true);
      navigationService.navigateTo(bottomNavigationRoute);
      notifyListeners();
    } catch (e) {
      notifyListeners();
      stopLoader();
      showCustomToast(e.toString());
    }
  }

}