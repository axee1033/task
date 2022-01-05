import 'dart:developer';

import 'package:task/modals/payment_modal.dart';
import 'package:task/utils/services/api_service.dart';
import 'package:task/utils/services/endpoints.dart';

class HomeServices {
  Future getPayment() async {
    return ApiService()
        .request(EndPoints.payments, "get", queryParamters: {}).then((value) {
      log("value ${value}");
      return value.map((e) => PaymentModal.fromJson(e)).toList();
    });
  }
}
