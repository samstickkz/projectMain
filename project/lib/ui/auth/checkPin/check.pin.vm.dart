import '../../base.vm.dart';

class CheckPinViewModel extends BaseViewModel{
  String pin = "";

  setPin(String val){
    pin = val;
    notifyListeners();
  }

}