import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:project/core/services/initializer.dart';
import 'package:project/core/services/initializer.dart';
import 'package:project/locator.dart';

import 'package:project/locator.dart';

import 'package:project/locator.dart';

import 'package:project/locator.dart';

import '../constants/reuseables.dart';
import '../core/services/app-cache.dart';
import '../core/services/navigation_services.dart';
import '../core/services/storage-service.dart';
import '../core/services/user.service.dart';
import '../core/services/web-services/auth.api.dart';
import 'widgets/action_dialog.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  NavigationService navigationService = locator<NavigationService>();
  UserService userService = locator<UserService>();
  AppCache appCache = locator<AppCache>();
  Initializer initializer = locator<Initializer>();
  AuthenticationApiService authApi = locator<AuthenticationApiService>();
  StorageService storageService = locator<StorageService>();

  final formKey = GlobalKey<FormState>();

  ViewState get viewState => _viewState;

  set viewState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }

  bool isLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.busy;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.idle;
      notifyListeners();
    }
  }

  popDialog(BuildContext context, VoidCallback onTap, String title)async{
    showCupertinoModalSheet<Widget>(
        context: context,
        builder: (BuildContext context) => ActionBottomSheet(
          onTap: onTap,
          title: title,
        ));
  }

}