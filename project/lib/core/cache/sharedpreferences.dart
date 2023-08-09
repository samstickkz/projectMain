import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class SharedPreference extends ChangeNotifier {
  final String onBoardingCompletedKey = 'onBoardingCompleted';
  static const String loggedIn = 'isLoggedIn';
  static const String userSetPinKey = 'userSetPin';
  static const String userInfoKey = 'userInfoKey';
  static const String twoFaBool = 'twoFaBool';
  static const String themeMode = 'isDarkMode';
  static const String presetData = '@presetData';
  final String emailKey = 'emailKey';
  final String passwordKey = 'password';
  final String user = '@user';
  final String userData = '@userData';
  final String tokenKey = 'token';
  final String nameKey = 'name';
  final String userTypeData = 'userTypeData';
  final String firstNameKey = 'firstName';
  final String pinKey = 'pin';

  /// clear shared preferences
  Future<void> clear() async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.clear();
  }

  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs?.remove(loggedIn);
    await prefs?.remove(pinKey);
    await prefs?.remove(firstNameKey);
    await prefs?.remove(nameKey);
    await prefs?.remove(tokenKey);
    await prefs?.remove(userSetPinKey);
    await prefs?.remove(userInfoKey);
    await prefs?.remove(twoFaBool);
    await prefs?.remove(presetData);
    await prefs?.remove(emailKey);
    await prefs?.remove(passwordKey);
    await prefs?.remove(user);
    await prefs?.remove(userData);
  }

  /// cache token
  void saveToken(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(tokenKey, id);
    notifyListeners();
  }
  /// get user token
  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(tokenKey) ?? '';
  }

  /// cache app first launch
  void saveOnBoardingCompleted(bool id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(onBoardingCompletedKey, id);
    notifyListeners();
  }
  /// get app first launch
  Future<bool> getOnBoardingCompleted() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(onBoardingCompletedKey) ?? false;
  }

  /// cache user logged in
  void saveIsLoggedIn(bool id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(loggedIn, id);
    notifyListeners();
  }
  /// get user logged in
  Future<bool> getIsLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(loggedIn) ?? false;
  }

  /// cache user set pin
  void saveIsUserSetPin(bool id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(userSetPinKey, id);
    notifyListeners();
  }
  /// get user set pin
  Future<bool> getIsUserSetPin() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(userSetPinKey) ?? false;
  }

  /// cache user email
  void saveEmail(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(emailKey, id);
    notifyListeners();
  }
  /// get user email
  Future<String> getEmail() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(emailKey) ?? '';
  }

  /// cache user password
  void savePassword(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(passwordKey, id);
    notifyListeners();
  }
  /// get user password
  Future<String> getPassword() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(passwordKey) ?? '';
  }

  /// cache user 2fa
  void save2fa(bool id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(twoFaBool, id);
    notifyListeners();
  }
  /// get user 2fa
  Future<bool> get2fa() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(twoFaBool) ?? false;
  }

  /// cache user preset
  void savePreset(bool id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(presetData, id);
    notifyListeners();
  }
  /// get user 2fa
  Future<bool> getPreset() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(presetData) ?? false;
  }

  /// cache user ID
  void saveID(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(user, id);
    notifyListeners();
  }

  /// get user ID
  Future<String> getID() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(user) ?? '';
  }

  /// cache theme
  void setTheme(bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(themeMode, value.toString());
    notifyListeners();
  }
  /// get theme
  Future<bool> getTheme() async {
    prefs = await SharedPreferences.getInstance();
    String value=  prefs!.getString(themeMode) ?? '';
    if(value != "true"){
      return false;
    }
    else{
      return true;
    }
  }

  /// cache user name
  void saveFullName(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(nameKey, id);
    notifyListeners();
  }

  /// get user name
  Future<String> getFullName() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(nameKey) ?? '';
  }

  /// cache user name
  void saveUserType(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(userTypeData, id);
    notifyListeners();
  }

  /// get user name
  Future<String> getUserType() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(userTypeData) ?? '';
  }

  /// cache user first name
  void saveFirstName(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(firstNameKey, id);
    notifyListeners();
  }

  /// get user first name
  Future<String> getFirstName() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(firstNameKey) ?? '';
  }

  /// cache user pin
  void saveTarget(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(pinKey, id);
    notifyListeners();
  }

  /// get user pin
  Future<String> getTarget() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(pinKey) ?? '0.0';
  }
}
