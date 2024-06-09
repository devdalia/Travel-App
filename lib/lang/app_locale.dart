
import 'package:amwaj_car/lang/ar.dart';
import 'package:amwaj_car/lang/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../local_storage/shared_preferences/preferences.dart';

class AppLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar
  };

  static void changeLang() {
    String newLanguageCode = HiveController().languageCode == 'en' ? 'ar' : 'en';
    Get.updateLocale(Locale(newLanguageCode));
    HiveController().setLanguage(newLanguageCode);
  }

}