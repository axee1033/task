import 'dart:developer';

class ResponseModel {
  final int responseCode;
  final String responseMessage;
  final dynamic dataSet;
  ResponseModel({
    required this.responseCode,
    required this.responseMessage,
    required this.dataSet,
  });
  factory ResponseModel.fromJson(final json) {
    return ResponseModel(
      responseCode: json["responseCode"],
      responseMessage: json["responseMessage"],
      dataSet: json["dateSet"],
    );
  }
}
