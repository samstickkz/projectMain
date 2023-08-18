import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/constants/palette.dart';
import 'package:project/core/models/loggedi_in_user.dart';
import 'package:project/ui/widgets/app_button.dart';
import 'package:project/ui/widgets/apptexts.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../base.ui.dart';
import 'create.pin.vm.dart';

class CreatePinScreen extends StatelessWidget {
  final SaveUser user;
  const CreatePinScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CreatePinViewModel>(
      onModelReady: (m){
        m.context = context;
        m.user = user;
      },
      builder: (_, model, child){
        return Scaffold(
          appBar: AppBar(
            title: Text("Set PIN"),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText("Choose security PIN", isBold: true, size: 22,),
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
                          // onCompleted: ,
                          onChanged: model.setPin,
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          }, appContext: context,
                        ),
                        model.pin.length==4?AppButton(onTap: model.goToNextPage, text: "NEXT", isGradient: true,):5.0.sbH
                      ],
                    ),
                  )
              ),
            ],
          ),
        );
      },
    );
  }
}

class PinButton extends StatelessWidget {
  final String value;
  final VoidCallback onTap;
  final Widget? icon;
  const PinButton({
    super.key, required this.value, required this.onTap, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF434343),
          padding: const EdgeInsets.symmetric(vertical: 12)
        ),
        onPressed: onTap,
        child: icon?? AppText(value, size: 20, isBold: true,)
      ),
    );
  }
}
