import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/constants/palette.dart';
import 'package:project/ui/widgets/apptexts.dart';
import 'package:project/utils/widget_extensions.dart';
import '../../../constants/reuseables.dart';
import 'login.vm.dart';
import '../../base.ui.dart';
import '../../widgets/app_button.dart';
import '../../widgets/text_field.dart';
import '../../../utils/string-extensions.dart';
import '../../../authentication/local_auth.dart';

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
        appBar: AppBar(),
        body: Container(
          width: width(context),
          padding: 16.0.padH,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    16.0.sbH,
                    SvgPicture.asset(AppImages.logoFull, height: 45, fit: BoxFit.contain,),
                    20.0.sbH,
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
                            autofillHints: const [AutofillHints.email],
                            onChanged: (val){
                              model.formKey.currentState?.validate();
                            },
                          ),
                          16.0.sbH,
                          AppTextField(
                            hint: "Enter your password",
                            keyboardType: TextInputType.visiblePassword,
                            controller: model.passwordController,
                            validator: passwordValidator,
                            isPassword: true,
                            onChanged: (val){
                              model.formKey.currentState?.validate();
                            },
                            autofillHints: const [AutofillHints.password],
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                //reset password wit firebase
                                onTap: model.resetPassword,
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
                      child: const Icon(Icons.fingerprint)
                    ),
                  ),
                  16.0.sbW,
                  Expanded(
                    flex: 4,
                    child:AppButton(
                      onTap: model.signInWithGoogle,
                      isTransparent: true,
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
                    onTap: model.register,
                    child: AppText(
                      '  click here to register', isBold: true, size: 14,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              50.0.sbH
            ],
          ),
        ),
      )
    );
  }
}
