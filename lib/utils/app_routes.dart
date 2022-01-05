 

import 'package:flutter/material.dart';
import 'package:task/screens/home_screen/home_screen.dart';
import 'package:task/screens/login_screen/login_screen.dart';
import 'package:task/screens/singup_screen/singup_screen.dart';
import 'package:task/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static String initialRoute = "/welcome-screen";
  static String loginScreen = "/Login-screen";
  static String homeScreen = "/hone-screen";
  static String singupScreen = "/SignUp-screen";

  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    homeScreen: (context) => const HomeScreen(),
    singupScreen: (context) => SignUpScreen(),
  };
}
