import 'dart:developer';

import 'package:task/utils/services/api_service.dart';
import 'package:task/utils/services/endpoints.dart';

class LoginServices {
  Future login({required String email, required String password}) async {
    return ApiService().request(EndPoints.login, "POST",
        queryParamters: {"email": email, "password": password}).then((value) {
      return value;
    });
  }
}
