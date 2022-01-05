class PaymentModal {
  final String userName;
  final String phoneNumber;
  final String money;
  final String transferNo;
  final String transferDate;
  final String enterpriseName;
  PaymentModal({
    required this.userName,
    required this.phoneNumber,
    required this.money,
    required this.enterpriseName,
    required this.transferDate,
    required this.transferNo,
  });
  factory PaymentModal.fromJson(final json) => PaymentModal(
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        money: json["money"],
        enterpriseName: '',
        transferDate: '',
        transferNo: '',
      );
}
