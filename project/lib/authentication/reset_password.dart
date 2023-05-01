import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

final TextEditingController _emailController = TextEditingController();

class _ResetPasswordState extends State<ResetPassword> {
  // dispose method
  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   super.dispose();
  // }

  // reset password method
  void resetPassword() async {
    String email = _emailController.text.trim();
    if (email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Password reset email sent'),
            content: Text('An email has been sent to $email with instructions to reset your password.'),
            actions: [
              TextButton(
                onPressed: () {

                  // go back to previous page with getx

                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error resetting password'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Center(child: Text('     ')),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            // button to reset password
            ElevatedButton(
              onPressed: () {
                resetPassword();
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
