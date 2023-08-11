import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:project/constants/palette.dart';
import 'package:project/ui/auth/register/register.ui.dart';
import 'package:project/authentication/reset_password.dart';
import 'package:project/authentication/services.dart';
import 'package:project/ui/widgets/apptexts.dart';
import 'package:project/utils/widget_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../screens/nav.dart';
import 'login.vm.dart';
import '../../base.ui.dart';
import '../../widgets/app_button.dart';
import '../../widgets/text_field.dart';
import '../../../utils/string-extensions.dart';
import '../../../authentication/local_auth.dart';
import '../../../authentication/login.start.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, child)=> Scaffold(
        body: SafeArea(
          child: Container(
            width: width(context),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
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
                Expanded(
                  child: ListView(
                    children: [
                      28.0.sbH,
                      Row(
                        children: const [
                          Expanded(child: AppText("Sign in to your account", isBold: true, align: TextAlign.center, size: 34,)),
                        ],
                      ),
                      32.0.sbH,
                      Form(
                        key: model.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AppTextField(
                              hint: "Enter your Email",
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                              controller: model.emailController,
                            ),
                            16.0.sbH,
                            AppTextField(
                              hint: "Enter your password",
                              keyboardType: TextInputType.visiblePassword,
                              controller: model.passwordController,
                              isPassword: true,
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  //reset password wit firebase
                                  onTap: ()=> model.resetPassword(context),
                                  child: const AppText('Forgot Password?'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppButton(
                  onTap: model.loginCheck,
                  isGradient: true,
                  isLoading: model.isLoading,
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child:AppButton(
                        onTap: () async {
                          final authenticate = await LocalAuthAPI.authenticate();
                          setState(() {
                            // authenticated = authenticate;
                          });
                        },
                        isTransparent: true,
                        isLoading: model.isLoading,
                        child: const Icon(Icons.fingerprint)
                      ),
                    ),
                    16.0.sbW,
                    Expanded(
                      flex: 4,
                      child:AppButton(
                        onTap: authService().signinWithGoogle,
                        isTransparent: true,
                        isLoading: model.isLoading,
                        child: Row(
                          children: [
                            Image.asset(
                              'images/Google.png',
                              width: 18,
                              height: 18,
                            ),
                            10.0.sbW,
                            const AppText(
                              'SignUp in Google'
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                16.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: AppText(
                        'Don\'t have an account?', size: 14,align: TextAlign.end,
                      ),
                    ),
                    InkWell(
                      onTap: ()=> model.goToRegister(context),
                      child: AppText(
                        '  click here to register', isBold: true, size: 14,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
