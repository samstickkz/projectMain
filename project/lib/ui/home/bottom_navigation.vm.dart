import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../wallet/main_wallet_dashbaord.dart';
import '../../wallet/portfolio.dart';
import '../../wallet/wallet_deposit.dart';
import '../base.vm.dart';
import 'navigations/home/home.ui.dart';

class BottomNavigationViewModel extends BaseViewModel{

  ValueNotifier<int>pageIndex = ValueNotifier(0);

  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }


  late List<Widget> pages =const [
    HomePage(),
    WalletDeposit(),
    PortFolio(),
    Scaffold()
  ];

  void refreshAllInfo() async {
    await initializer.init();
    refresh();
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }

  willPop(BuildContext context){
    popDialog(context, pop, "Close App");
  }

}