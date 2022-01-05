import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/home_screen/home_screen_contoller.dart';
import 'package:task/utils/app_routes.dart';
import 'package:task/utils/constants.dart';
import 'package:task/utils/services/api_service.dart';
import 'package:task/utils/services/localization_services.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeContolerr>(
      create: (_) => HomeContolerr(),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        supportedLocales: SupportedLocales.all,
        locale: SupportedLocales.arabic,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute:
            userToken != "" ? AppRoutes.homeScreen : AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
