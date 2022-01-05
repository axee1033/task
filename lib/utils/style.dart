//Colors
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff4F0091);
const Color secondaryColor = Color(0xff009877);
const Color redColor = Color(0xffF03913);
const Color darkColor = Color(0xff3A4759);
const Color greyColor = Color(0xff8c8c8c);
const Color darkGreyColor = Color(0xff707070);
const Color yellowColor = Color(0xffffd100);
const Color rosyBrown = Color(0xffF2F5FC);
const String emailValidation =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const BoxDecoration backGroundDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/backgound.png"),
    fit: BoxFit.cover,
  ),
);

const String passwordValidation =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&^*~]).{8,}';
