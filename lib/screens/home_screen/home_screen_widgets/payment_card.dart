import 'package:flutter/material.dart';
import 'package:task/modals/payment_modal.dart';
import 'package:task/utils/style.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({required this.payment});
  final PaymentModal payment;

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOpened = !isOpened;
        });
      },
      child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //-------------- closed ------------------//
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.payment.userName,
                      style: TextStyle(color: primaryColor, fontSize: 13),
                    ),
                    Text(
                      widget.payment.phoneNumber,
                      style: TextStyle(color: greyColor, fontSize: 13),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      widget.payment.money,
                      style: TextStyle(color: redColor, fontSize: 13),
                    ),
                    Text(
                      "ريال سعودي",
                      style: TextStyle(color: greyColor, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            if (isOpened) const SizedBox(height: 20),
            if (isOpened)
              Column(children: [
                Row(
                  children: [
                    Text(
                      "رقم التحويل  :  ",
                      style: TextStyle(color: greyColor, fontSize: 13),
                    ),
                    Text(
                      widget.payment.transferNo,
                      style: TextStyle(color: darkColor, fontSize: 13),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "تاريخ التحويل  :  ",
                      style: TextStyle(color: greyColor, fontSize: 13),
                    ),
                    Text(
                      widget.payment.transferDate,
                      style: TextStyle(color: darkColor, fontSize: 13),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      " اسم المنشأة  :  ",
                      style: TextStyle(color: greyColor, fontSize: 13),
                    ),
                    Text(
                      widget.payment.enterpriseName,
                      style: TextStyle(color: primaryColor, fontSize: 13),
                    )
                  ],
                ),
              ]),
          ],
        ),
      ),
    );
  }
}
/*
 Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            payment.userName,
            style: TextStyle(color: primaryColor, fontSize: 13),
          ),
          Text(
            payment.phoneNumber,
            style: TextStyle(color: greyColor, fontSize: 13),
          ),
        ],
      ),
 Column(
          children: [
            Text(
              payment.money,
              style: TextStyle(color: primaryColor, fontSize: 13),
            ),
            Text(
              "ريال سعودي",
              style: TextStyle(color: greyColor, fontSize: 13),
            ),
          ],
        ),*/