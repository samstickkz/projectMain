import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:project/core/models/loggedi_in_user.dart';
import 'package:project/core/services/web-services/nertwork_config.dart';
import 'package:project/ui/base.vm.dart';
import 'package:project/utils/snack_message.dart';

import '../../../../core/models/crypto_response.dart';
import '../../../../core/services/web-services/external_api.dart';
import '../../../../locator.dart';
import 'buy_token/buy.token.ui.dart';

class HomePageViewModel extends BaseViewModel{

  HomePageViewModel(){
    init();
  }

  init()async{
    // await fetchCryptoPrice();
  }

  ExternalApiServices api = locator<ExternalApiServices>();


  setAsHidden(){
    bool changedValue = userService.userCredentials.isHidden==null?false:userService.userCredentials.isHidden==true?false:true;
    SaveUser user = SaveUser(
      name: userService.userCredentials.name,
      email: userService.userCredentials.email,
      phoneNumber: userService.userCredentials.phoneNumber,
      profilePhoto: userService.userCredentials.profilePhoto,
      uuid: userService.userCredentials.uuid,
      token: userService.userCredentials.token,
      isHidden: changedValue,
    );
    userService.storeUser(user);
    initializer.init();
    notifyListeners();
  }

  Stream<List<CryptoResponse>> fetchCryptoPrice() async*{
    final response = await api.fetchCryptoPrice();
    yield response;
  }

  ScrollController scrollController = ScrollController();

  popBuyToken(BuildContext context){
    showCupertinoModalSheet(
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.6,
          maxChildSize: 0.9,
          builder: (context, scrollController){
            return const BuyTokenScreen();
          }
        );
      },
    );
  }

  // Future<void> fetchCryptoPrice() async {
  //   final plugin = PaystackPlugin();
  //   startLoader();
  //   try {
  //     plugin.initialize(publicKey: NetworkConfig.paystackPublicKey);
  //     List<CryptoResponse> response = await api.fetchCryptoPrice();
  //     stopLoader();
  //   } catch (e) {
  //     print('Error fetching crypto prices: $e');
  //     stopLoader();
  //   }
  // }
}