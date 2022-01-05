import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/screens/home_screen/home_screen_widgets/filert_alert.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/style.dart';

class TotalPaidSection extends StatelessWidget {
  const TotalPaidSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("width: getProportionateScreenWidth(60),${MediaQuery.of(context).size.width} ");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenHeight(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: getProportionateScreenHeight(50),
            width: getProportionateScreenWidth(280),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إجمالي المدفوعات",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "3500000  ريال سعودي",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              filterAlert(context: context);
            },
            child: Container(
              height: getProportionateScreenHeight(40),
              width: getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.filter_alt, color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
