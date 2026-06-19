import 'package:flutter/material.dart';

class LoginInfoProvider extends ChangeNotifier {
  String? email;
  String? passowrd;

  LoginInfoProvider();

  void setPhoneNumber({required String newEmail}) async {
    email = newEmail;
    notifyListeners();
  }

  void setPassword({required String newPassword}) async {
    passowrd = newPassword;
    notifyListeners();
  }
}
