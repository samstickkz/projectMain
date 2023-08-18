import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../../constants/palette.dart';
import '../../../core/models/loggedi_in_user.dart';
import '../../base.ui.dart';
import '../../widgets/app_button.dart';
import '../../widgets/apptexts.dart';
import 'finish_pin.vm.dart';

class FinishPinScreen extends StatelessWidget {
  final SaveUser user;
  final String pin;
  const FinishPinScreen({Key? key, required this.user, required this.pin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FinishPinViewModel>(
      onModelReady: (m){
        m.context = context;
        m.user = user;
        m.originalPin = pin;
      },
      builder: (_, model, child){
        return Scaffold(
          appBar: AppBar(
            title: Text("Confirm PIN"),
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
                        const AppText("Confirm Pin", isBold: true, size: 22,),
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
                          onCompleted: model.setPin,
                          onChanged: (value) {
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          }, appContext: context,
                        ),
                        model.pin==pin ? AppButton(onTap: ()=> model.updatePin(model.pin, "${user.uuid}"), text: "SUBMIT", isTransparent: true, borderColor: primaryColor,):0.0.sbH
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
