class ResponseModel {
  final int responseCode;
  final String responseMessage;
  final dynamic dataSet;
  ResponseModel({
    required this.responseCode,
    required this.responseMessage,
    required this.dataSet,
  });
  factory ResponseModel.fromJson(final json) => ResponseModel(
        responseCode: json['result']["responseCode"],
        responseMessage: json['result']["responseMessage"],
        dataSet: json['result']["dateSet"],
      );
}
