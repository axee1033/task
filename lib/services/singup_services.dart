import 'dart:developer';
import 'dart:convert';

import 'package:task/modals/user_modale.dart';
import 'package:task/utils/services/api_service.dart';
import 'package:task/utils/services/endpoints.dart';

class SingUpServices {
  Future getUserRoles() async {
    return ApiService().request(EndPoints.userRoles, "get").then((value) {
      return value;
    });
  }

  Future registerUser({required UserModal user}) async {
    return ApiService()
        .request(EndPoints.registerUser, "POST", queryParamters: {
      "fullName": user.fullName,
      "email": user.email,
      "password": user.password,
      "roles": user.roles.map((e) => e as String).toList(),
    }).then((value) {
   
      return value;
    });
  }
}
