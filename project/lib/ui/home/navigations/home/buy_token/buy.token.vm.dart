import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:project/ui/base.vm.dart';

import '../../../../../core/services/web-services/nertwork_config.dart';
import '../../../../../utils/snack_message.dart';

class BuyTokenViewModel extends BaseViewModel{
  TextEditingController amountController = TextEditingController();

  String message = '';

  void makePayment(BuildContext context) async {
    final plugin = PaystackPlugin();
    await plugin.initialize(publicKey: NetworkConfig.paystackPublicKey);
    FocusManager.instance.primaryFocus?.unfocus();
    if(formKey.currentState!.validate()){
      int price = int.parse(amountController.text) * 100;
      Charge charge = Charge()
        ..amount = price
        ..reference = 'ref_${DateTime.now()}'
        ..email = userService.userCredentials.email
        ..currency = 'NGN';

      CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
      );

      if (response.status == true) {
        message = 'Payment was successful. Ref: ${response.reference}';

        showCustomToast("Your payment was successful", success: true);
        navigationService.goBack();
      } else {
        showCustomToast(response.message);
      }
    }
  }

}