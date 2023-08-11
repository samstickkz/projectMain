import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/base.vm.dart';
import 'package:project/utils/snack_message.dart';

import '../../../authentication/reset_password.dart';
import '../register/register.dart';

class LoginViewModel extends BaseViewModel{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loginCheck()async{
    if(formKey.currentState?.validate()?? false){
      await login();
    }
  }

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

  Future<void> login() async {
    startLoader();

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      showCustomToast(userCredential.user?.email??"");

      // Get.to(() => const NavPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showCustomToast('Egbon, goan create an account joh.');
      } else if (e.code == 'wrong-password') {
        showCustomToast('shey you no know your password ni ?');
      } else {
        showCustomToast(e.message??"");
      }
    } catch (e) {
      showCustomToast(e.toString());
    }
  }

}