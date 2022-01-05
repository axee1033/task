import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/modals/response_modal.dart';
import 'package:task/screens/home_screen/home_screen_contoller.dart';

import '../constants.dart';

class ApiService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }
  factory ApiService() {
    return _apiUtil;
  }

  Dio dio = new Dio();

  init() async {
    dio.options.baseUrl = apiUrl;
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 30000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userToken = preferences.getString(tokenKey)!;
    log("token $userToken");
    return;
  }

  Future<T?> request<T>(String endPoint, String method,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParamters,
      String contentType = "application/json"}) async {
    log("token $userToken");
    try {
      Response response = await dio.request<T>(
        endPoint,
        data: queryParamters,
        queryParameters: queryParamters,
        options: Options(
          method: method,
          contentType: "application/json",
          headers: {
            "Authorization": "Bearer $userToken",
            "Accept-Langugage": "application/json",
          },
        ),
      );

      if (response.statusCode != 200) {
        log("status: ${response.statusCode}");
        throw "status code error : ${response.statusCode}";
      }

      //Parse response
      final dataModel =
          ResponseModel.fromJson(response.data['result'] ?? response.data);

      // ignore: unrelated_type_equality_checks

      if (dataModel.dataSet == null) {
        Fluttertoast.showToast(msg: dataModel.responseMessage);
      }

      if (response.data['totalAmount'] != null) {
        log(response.data['totalAmount']);
        HomeContolerr().totalAmount = int.parse(response.data['totalAmount']);
      }

      log("value ${dataModel.dataSet}");
      return dataModel.dataSet;
    } catch (e) {
      log("Error: $e");
      //@TODO: Add alert dialogue
      return null;
    }
  }
}
