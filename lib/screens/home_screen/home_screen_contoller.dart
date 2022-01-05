import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/modals/payment_modal.dart';
import 'package:task/services/home_services.dart';

class HomeContolerr extends ChangeNotifier {
  List _payments = [];
  int _totalAmount = 0;

  get totalAmount => _totalAmount;
  set totalAmount(value) {
    _totalAmount = value;
    notifyListeners();
  }

  List get payment => _payments;
  bool _isGetingData = true;
  bool get loading => _isGetingData;

  Future getPayment() async {
    if (_isGetingData) {
      _payments.clear();
      HomeServices().getPayment().then((value) {
        if (value != null) {
          _payments = value;
          _isGetingData = false;
          notifyListeners();
          return _payments;
        } else {
          _isGetingData = false;
          notifyListeners();
          return [];
        }
      });
    }
  }
}
