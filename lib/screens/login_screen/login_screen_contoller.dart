import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/services/login_services.dart';
import 'package:task/utils/app_routes.dart';

class LoginScreenContoller {
  static final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool _passwordShow = false;

  String get userEmail => _email!;
  bool get passwordShow => _passwordShow;

  set userEmail(String value) {
    _email = value;
  }

  set userPassword(String value) {
    _password = value;
  }

  String get userPassword => _password!;

  set passwordShow(bool value) {
    _passwordShow = value;
  }

  login({required BuildContext context}) async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();

      var res =
          await LoginServices().login(email: userEmail, password: userPassword);
      return res;

      //Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
    }
  }
}
