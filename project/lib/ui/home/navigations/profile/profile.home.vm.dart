import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/reuseables.dart';
import 'package:project/core/models/model.dart';
import 'package:project/ui/base.vm.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/snack_message.dart';
import '../../../widgets/action_dialog.dart';

class ProfileHomeViewModel extends BaseViewModel{

  ProfileHomeViewModel(){
    init();
  }

  init(){
    account = [
      ProfileButtonModel(title: "Logout", svgImage: AppImages.logoutIcon, onTap:popLogout),
      ProfileButtonModel(title: "Deactivate Account", svgImage: AppImages.delete, isLogout: true),
    ];
  }

  addContext(BuildContext contexts)async {
    context = contexts;
    notifyListeners();
  }

  late BuildContext context;

  List<ProfileButtonModel> general = [
    ProfileButtonModel(title: "Payment Details", svgImage: AppImages.paymentIcon),
    ProfileButtonModel(title: "Verification", svgImage: AppImages.verificationIcon),
  ];

  List<ProfileButtonModel> preferences = [
    ProfileButtonModel(title: "Activate Push Notification", svgImage: AppImages.pushNotification),
    ProfileButtonModel(title: "Change Theme", svgImage: AppImages.theme),
    ProfileButtonModel(title: "Language", svgImage: AppImages.language),
  ];

  List<ProfileButtonModel> others = [
    ProfileButtonModel(title: "Contact Support", svgImage: AppImages.supportIcon),
    ProfileButtonModel(title: "Referral Program", svgImage: AppImages.referralIcon),
  ];

  List<ProfileButtonModel> account = [];

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

  popLogout(){
    showCupertinoModalSheet<Widget>(
        context: context,
        builder: (BuildContext context) => ActionBottomSheet(
          onTap:logout,
          title: "Logout",
        ));
  }


}
