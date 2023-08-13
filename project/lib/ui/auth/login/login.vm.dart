import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/base.vm.dart';
import 'package:project/utils/snack_message.dart';

import '../../../authentication/reset_password.dart';
import '../../../authentication/services.dart';
import '../../../screens/nav.dart';
import '../register/register.ui.dart';

class LoginViewModel extends BaseViewModel{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loginCheck()async{
    if(formKey.currentState?.validate()?? false){
      await login();
    }
  }

  // fixes made

  resetPassword(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ResetPassword()));
  }

  goToRegister(BuildContext context)async{
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  Future<OAuthCredential?> signInWithGoogle() async {
    startLoader();
    try{
      OAuthCredential response = await authService().signinWithGoogle();
      stopLoader();
      await signInWithCredential(response);
      notifyListeners();
      return response;
    }catch(err){
      stopLoader();
      notifyListeners();
      return null;
    }
  }

  Future<UserCredential?> signInWithCredential(OAuthCredential credential) async {
    startLoader();
    try{
      UserCredential response = await authService().signInWithCredential(credential);
      stopLoader();
      showCustomToast("Login Successful", success: true);
      Get.to(() => const NavPage());
      notifyListeners();
      return response;
    }catch(err){
      stopLoader();
      notifyListeners();
      return null;
    }
  }

  Future<void> login() async {
    startLoader();

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      notifyListeners();


      // Get.to(() => const NavPage());
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      if (e.code == 'user-not-found') {
        notifyListeners();
        showCustomToast('Egbon, goan create an account joh.');
      } else if (e.code == 'wrong-password') {
        notifyListeners();
        showCustomToast('shey you no know your password ni ?');
      } else {
        notifyListeners();
        showCustomToast(e.message??"");
      }
    } catch (e) {
      notifyListeners();
      showCustomToast(e.toString());
    }
  }

}