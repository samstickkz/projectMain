import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/locator.dart';
import 'package:project/ui/base.vm.dart';
import 'package:project/utils/snack_message.dart';

import '../../../../../routes/routes.dart';
import '../../../../widgets/action_dialog.dart';

class DrawerViewModel extends BaseViewModel{
  DrawerViewModel(){
    print(userService.userCredentials.profilePhoto);
  }

  logout()async{
    try {
      await FirebaseAuth.instance.signOut();
      storageService.deleteAllItems();
      userService.storeUser(null);
      await initializer.init();
      notifyListeners();
      // login with getx
      navigationService.navigateToAndRemoveUntil(loginRoute);
    } catch (e) {
      showCustomToast("Error signing out");
    }
  }

  popLogout(BuildContext context){
    showCupertinoModalSheet<Widget>(
        context: context,
        builder: (BuildContext context) => ActionBottomSheet(
          onTap:logout,
          title: "Logout",
        ));
  }
}