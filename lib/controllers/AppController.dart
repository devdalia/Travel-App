import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  RxInt index = 4.obs;
  RxInt indexTrip = 0.obs;
  RxBool isInternet = true.obs;
  RxBool mode=false.obs;
  RxString type = 'login'.obs;
  RxString trip = 'client'.obs;
  RxString home = 'client'.obs;
  RxString homeClient = 'home'.obs;
  RxString login = 'no'.obs;
  RxString typePackagesScreen = 'display'.obs;

  RxString typePostalScreen = 'display'.obs;
  RxString typePostalSelect = ''.obs;

  changeIndex(int i) {
    index.value = i;
  }

  checkInternet(bool internet) {
    isInternet.value = internet;
    isInternet.refresh();
  }

  changeTripIndex(int i) {
    indexTrip.value = i;
  }
  void theme(){
    bool themeDark= HiveController().getMode;
    mode.value=themeDark;
    update();
  }
  void switchTheme(bool dark) {
    mode.value=dark;
    HiveController().modeApp(dark);
    mode.refresh();
    Get.changeThemeMode(HiveController().getMode==false ? ThemeMode.light : ThemeMode.dark);
    update();
  }
}
