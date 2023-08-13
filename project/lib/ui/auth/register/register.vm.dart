import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/snack_message.dart';

import '../../base.vm.dart';

class RegisterViewModel extends BaseViewModel {
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool success = false;

  @override
  void dispose() {
    fullNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }



  Future signUp() async {
    if (formKey.currentState?.validate()==true){
      FocusManager.instance.primaryFocus?.unfocus();
      startLoader();
      Future<bool> passwordconfirmed() async {
        startLoader();
        if (passwordController.text.trim() ==
            confirmPasswordController.text.trim()) {
          User? user = FirebaseAuth.instance.currentUser;

          if (user != null && !user.emailVerified) {
            await user.sendEmailVerification();
          }
          stopLoader();
          return true;
        } else {
          stopLoader();
          return false;
        }
      }

      if (await passwordconfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        addUser();
        stopLoader();
      }
      stopLoader();
    }
  }

  // future add user to firestore
  Future<void> addUser() {
    startLoader();
    // Call the user's CollectionReference to add a new user
    return FirebaseFirestore.instance
        .collection('users')
        .doc(fullNameController.text)
        .set({
      'firstname': fullNameController.text.split(' ')[0], // John Doe
      'lastname': fullNameController.text.split(' ').last, // Stokes and Sons
      // 42
    }).then((value) {
      stopLoader();
      showCustomToast("Your payment was successful", success: true);
    },

    ).catchError(
          (error) {
            stopLoader();
            showCustomToast("smh , nawa for you oh");
            },
    );
  }

}