import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/constants/reuseables.dart';
import 'package:project/routes/routes.dart';
import 'package:project/utils/snack_message.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../../constants/palette.dart';
import '../../base.ui.dart';
import '../../widgets/app_button.dart';
import '../../widgets/apptexts.dart';
import 'check.pin.vm.dart';

class CheckPinScreen extends StatelessWidget {
  const CheckPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CheckPinViewModel>(
      builder: (_, model, child)=> Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          20.0.sbH,
                          Row(
                            children: [
                              Container(
                                height: 60, width: 60,
                                child: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider("${userService.userCredentials.profilePhoto}"),
                                  radius: 30,
                                ),
                              ),
                              16.0.sbW,
                              Expanded(child: AppText("Welcome\n${userService.userCredentials.name}", isBold: true, size: 22,)),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const AppText("Please enter pin to proceed"),
                          16.0.sbH,
                          PinCodeTextField(
                            length: 4,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            obscureText: true,
                            autoFocus: true,
                            animationType: AnimationType.fade,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              inactiveFillColor: Colors.grey,
                              inactiveColor: Colors.transparent,
                              selectedFillColor: primaryColor,
                              selectedColor: Colors.transparent,
                              activeColor: Colors.transparent,
                              activeFillColor: Theme.of(context).iconTheme.color?.withOpacity(0.1),
                            ),
                            animationDuration: const Duration(milliseconds: 300),
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            enableActiveFill: true,
                            // errorAnimationController: model.errorController,
                            // controller: model.textEditingController,
                            onCompleted: (v){
                              if(v!=userService.userCredentials.appPassword){
                                showCustomToast("Pin should be the same as saved pin");
                              }
                            },
                            onChanged: model.setPin,
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            }, appContext: context,
                          ),
                        ],
                      ),
                      model.pin==userService.userCredentials.appPassword?AppButton(onTap: (){
                        navigationService.navigateToAndRemoveUntil(bottomNavigationRoute);
                      }, text: "NEXT", isGradient: true,):5.0.sbH
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
