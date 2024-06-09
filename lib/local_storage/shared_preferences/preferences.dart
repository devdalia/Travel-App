import 'package:hive_flutter/hive_flutter.dart';
class HiveController {
  static HiveController instance = HiveController._();
  late HiveController sharedPreferences;
  HiveController._();

  factory HiveController() {
    return instance;
  }

  late final userDataBox;
  late final settingsBox;

  Future<void> initHive() async {
    await Hive.initFlutter();
    userDataBox = await Hive.openBox('userData');
    settingsBox = await Hive.openBox('settings');
  }
  // setting
  void setLanguage(String languageCode) async {
    return settingsBox.put('language_code', languageCode);
  }
 void setToken(String token) async {
    return userDataBox.put('token', token);
  }
  void setTypeAccount(String type) async {
    return userDataBox.put('type', type);
  }
  Future<int> logout() async {
    return await userDataBox.clear();
  }

  void modeApp(bool  dark) async {
    return await settingsBox.put('mode', dark);
  }

  String get  languageCode => settingsBox.get('language_code', defaultValue: 'ar');

  String get token => userDataBox.get('token',defaultValue: '');
  String get type => userDataBox.get('type',defaultValue: '');

  bool get getMode => settingsBox.get('mode', defaultValue: false);





}