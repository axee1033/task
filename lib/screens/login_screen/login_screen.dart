import 'dart:convert' as convert;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/screens/login_screen/login_screen_contoller.dart';
import 'package:task/shared_widgets/loading_widget.dart';
import 'package:task/utils/app_routes.dart';
import 'package:task/utils/constants.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/style.dart';

class LoginScreen extends StatelessWidget {
  final contoller = LoginScreenContoller();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: backGroundDecoration,
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                "assets/images/logo.png",
                width: getProportionateScreenWidth(100),
              ),
              const Spacer(flex: 1),
              Container(
                width: getProportionateScreenWidth(500),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: LoginScreenContoller.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "البريد الالكتروني",
                        style: TextStyle(color: greyColor),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: redColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (!RegExp(emailValidation).hasMatch(value!)) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          contoller.userEmail = value!;
                          log(" contoller.userEmail ${contoller.userEmail}");
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "كلمة المرور",
                        style: TextStyle(color: greyColor),
                      ),
                      StatefulBuilder(builder: (context, showPasswordSetter) {
                        return TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => showPasswordSetter(() {
                                contoller.passwordShow =
                                    !contoller.passwordShow;
                              }),
                              icon: Icon(
                                contoller.passwordShow
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: !contoller.passwordShow
                                    ? primaryColor
                                    : Colors.red,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length < 8) {
                              return '';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            contoller.userPassword = value!;
                          },
                        );
                      }),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenHeight(155),
                            vertical: 8,
                          ),
                        ),
                        onPressed: () async {
                          //loadingAlert(context);
                          log("messs");
                          var res = await contoller.login(context: context);
                          log("messs");
                          log("res $res");
                          // Navigator.of(context).pop();

                          if (res != null) {
                            SharedPreferences.getInstance().then((prefs) {
                              prefs.setString(tokenKey, res['token']);
                            });
                            Navigator.of(context)
                                .pushNamed(AppRoutes.homeScreen);
                          }
                        },
                        child: const Text("دخول"),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: secondaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(130),
                    vertical: 8,
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pushNamed(AppRoutes.singupScreen);
                },
                child: const Text("حساب جديد"),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
