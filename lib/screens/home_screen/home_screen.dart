import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/modals/payment_modal.dart';
import 'package:task/screens/home_screen/home_screen_contoller.dart';
import 'package:task/screens/home_screen/home_screen_widgets/payment_card.dart';
import 'package:task/screens/home_screen/home_screen_widgets/total_paid_section.dart';
import 'package:task/services/home_services.dart';
import 'package:task/utils/constants.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: rosyBrown,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "مدفوعات هلا",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ],
          bottom: PreferredSize(
            child: const TotalPaidSection(),
            preferredSize: Size.fromHeight(getProportionateScreenHeight(100)),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: FutureBuilder(
            future: Provider.of<HomeContolerr>(context).getPayment(),
            builder: (context, snapshot) {
              return Consumer<HomeContolerr>(
                builder: (context, payment, child) {
                  return payment.payment.isEmpty
                      ? const Center(
                          child: Text(
                            'لا يوجد مدفوعات !',
                          ),
                        )
                      : ListView.builder(
                          itemCount: payment.payment.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return PaymentCard(payment: payment.payment[index]);
                          });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
/*
ListView.builder(
              itemCount: Provider.of<HomeContolerr>(context).payment.length,
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PaymentCard(
                  payment: PaymentModal(
                      userName: "خالد محمود أبو دواد",
                      phoneNumber: "01234567891",
                      money: "25000",
                      transferDate: "20-09-2021 11:15:12.0256",
                      transferNo: "12345678912345",
                      enterpriseName: "ركن الرشيد"),
                );
              })
*/