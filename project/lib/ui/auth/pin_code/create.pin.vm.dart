import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/core/models/loggedi_in_user.dart';

import '../../base.vm.dart';
import 'finish_pin.ui.dart';

class CreatePinViewModel extends BaseViewModel {
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  var textEditingController = TextEditingController();

  SaveUser user = SaveUser();

  BuildContext? context;

  String pin = "";

  setPin(String val){
    pin = val;
    notifyListeners();
  }

  goToNextPage(){
    Navigator.of(context!).push(MaterialPageRoute(builder: (_)=> FinishPinScreen(user: user, pin: pin,)));
  }
}