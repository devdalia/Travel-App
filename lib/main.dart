import 'package:amwaj_car/helpers/binding.dart';
import 'package:amwaj_car/utilities/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sizer/sizer.dart';

import 'Screen/splash/splash_screen.dart';
import 'controllers/AppController.dart';
import 'lang/app_locale.dart';
import 'local_storage/shared_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveController().initHive();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor:HiveController().getMode == true?Colors.black12: Colors.white70));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetX<AppController>(
        init: AppController(),
        builder: (AppController controller) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Amwaj Car.com',
          theme: AppTheme.themeData(controller.mode.value, context),
          darkTheme: AppTheme.themeData(controller.mode.value, context),
          themeMode: HiveController().getMode == true
              ? ThemeMode.dark
              : ThemeMode.light,
          translations: AppLocale(),
          initialBinding: Binding(),
          locale: Locale(HiveController().languageCode),
          // supportedLocales: [
          //   const Locale('en', 'US'),
          //   const Locale('ar', 'AR'),
          // ],
          home: SplashScreen(),
        ),
      );
    });
  }
}
