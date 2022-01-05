import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/modals/user_modale.dart';
import 'package:task/services/singup_services.dart';

class SignUpContoller {
  Future onInit() async {
    _userRoles = await SingUpServices().getUserRoles();
    _roleType = _userRoles[0];
    return;
  }

  static final GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _fullName;
  String? _roleType;
  List _userRoles = [];
  bool _passwordShow = false;
  bool _isRequestDone = false;

  bool get passwordShow => _passwordShow;
  List get userRoles => _userRoles;
  String? get roleType => _roleType;
  bool get isRequestDone => _isRequestDone;

  set userRoleType(String value) => _roleType = value;

  set userFullName(String value) => _fullName = value;
  String get userFullName => _fullName!;
  set userEmail(String value) => _email = value;
  String get userEmail => _email!;
  set userPassword(String value) => _password = value;
  String get userPassword => _password!;
  set passwordShow(bool value) => _passwordShow = value;

  singUp({required BuildContext context}) {
    if (singupFormKey.currentState!.validate()) {
      singupFormKey.currentState!.save();

      SingUpServices()
          .registerUser(
              user: UserModal(
                  email: userEmail,
                  fullName: userFullName,
                  password: userPassword,
                  roles: [_roleType!]))
          .then((value) {
        if (value == null) {
          Navigator.of(context).pop();
        } else {}
      });
    }
  }
}
