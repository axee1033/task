import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/screens/singup_screen/singup_contoller.dart';
import 'package:task/shared_widgets/loading_widget.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/style.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final contoller = SignUpContoller();
  @override
  void initState() {
    contoller.onInit().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: backGroundDecoration,
        child: contoller.isRequestDone
            ? const LoadingWidget()
            : Column(
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
                      key: SignUpContoller.singupFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "الاسم بالكامل",
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
                              if (value!.isEmpty) {
                                return '';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              contoller.userFullName = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text("البريد الالكتروني",
                              style: TextStyle(color: greyColor)),
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
                              log("value ${value!}");
                              contoller.userEmail = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "كلمة المرور",
                            style: TextStyle(color: greyColor),
                          ),
                          StatefulBuilder(
                              builder: (context, showPasswordSetter) {
                            return TextFormField(
                              obscureText:
                                  !contoller.passwordShow ? false : true,
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
                                    color: contoller.passwordShow
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
                                if (value!.length < 8 ||
                                    !RegExp(passwordValidation)
                                        .hasMatch(value)) {
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
                          const Text("نوع المستخدم",
                              style: TextStyle(color: greyColor)),
                          DropdownButton<String>(
                            items: contoller.userRoles.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: contoller.roleType,
                            isExpanded: true,
                            onChanged: (value) {
                              contoller.userRoleType = value!;
                              setState(() {});
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenHeight(150),
                                vertical: 8,
                              ),
                            ),
                            onPressed: () async {
                              if (SignUpContoller.singupFormKey.currentState!
                                  .validate()) {
                                SignUpContoller.singupFormKey.currentState!
                                    .save();
                                loadingAlert(context);
                                var res =
                                    await contoller.singUp(context: context);
                                Navigator.of(context).pop();
                                if (res != null) {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                            child: const Text("تسجيل"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
      ),
    );
  }
}
