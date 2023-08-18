import 'package:flutter/material.dart';
import 'package:project/routes/routes.dart';

import '../../../core/models/loggedi_in_user.dart';
import '../../base.vm.dart';

class FinishPinViewModel extends BaseViewModel{
  SaveUser user = SaveUser();

  BuildContext? context;

  String originalPin = "";
  String pin = "";

  setPin(String val){
    pin = val;
    notifyListeners();
  }

  Future<bool> updatePin(String pin, String uid) async {
    print(uid);
    startLoader();
    try{
      var answer = await authApi.updatePin(pin, uid);
      if(answer){
        await userService.storeUser(user);
        await authApi.storeToken(user.uuid);
        stopLoader();
        notifyListeners();
        navigationService.navigateToAndRemoveUntil(bottomNavigationRoute);
        return true;
      }else{
        stopLoader();
        notifyListeners();
        return false;
      }
    }catch(err){
      stopLoader();
      notifyListeners();
      return false;
    }
  }

}