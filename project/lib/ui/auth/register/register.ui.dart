import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/ui/widgets/text_field.dart';
import 'package:project/utils/widget_extensions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/reuseables.dart';
import '../../base.ui.dart';
import '../../widgets/apptexts.dart';
import 'register.vm.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstnamecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  bool success = false;

  @override
  void dispose() {
    _firstnamecontroller.dispose();
    _lastnamecontroller.dispose();
    _passwordcontroller.dispose();
    _emailcontroller.dispose();
    _confirmpasswordcontroller.dispose();

    super.dispose();
  }

  Future signUp() async {
    Future<bool> passwordconfirmed() async {
      if (_passwordcontroller.text.trim() ==
          _confirmpasswordcontroller.text.trim()) {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
        }
        return true;
      } else {
        return false;
      }
    }

    if (await passwordconfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
      addUser();
    }
  }

  // future add user to firestore
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return FirebaseFirestore.instance
        .collection('users')
        .doc(_firstnamecontroller.text)
        .set({
          'firstname': _firstnamecontroller.text, // John Doe
          'lastname': _lastnamecontroller.text, // Stokes and Sons
          // 42
        })
        .then(
          (value) => showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Your payment was successful",
            ),
          ),

        )
        .catchError(
          (error) => showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "smh , nawa for you oh",
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      builder: (_, model, child)=> Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: 16.0.padH,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: navigationService.goBack,
                      child: Container(
                        height: 41,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: HexColor('E8ECF4'))),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                16.0.sbH,
                SvgPicture.asset(AppImages.logoFull, height: 45, fit: BoxFit.contain,),
                28.0.sbH,
                Row(
                  children: const [
                    Expanded(child: AppText("Create your account", isBold: true, align: TextAlign.center, size: 34,)),
                  ],
                ),
                const AppTextField(
                  hint: "first name",
                ),
                20.0.sbH,
                TextField(
                  controller: _firstnamecontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'first name',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _lastnamecontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Last name',
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter  email',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter your password',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // confirm password

                TextField(
                  controller: _confirmpasswordcontroller,
                  decoration: InputDecoration(
                    fillColor: HexColor('A7A7CC'),
                    filled: true,
                    labelText: 'Enter your password',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: signUp,
                  child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              HexColor('6262D9'),
                              HexColor('9D62D9'),
                            ]),

                        // color: HexColor('1E232C'),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  // onTap: signIn,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            HexColor('6262D9'),
                            HexColor('9D62D9'),
                          ]),

                      // color: HexColor('1E232C'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/Google.png',
                              width: 18,
                              height: 18,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'SignUp with Google ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'click here to register ?',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
