import 'package:flutter/material.dart';

import '../local_storage/shared_preferences/preferences.dart';
import 'const.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily:
          HiveController().languageCode == 'en' ? 'Tajawal' : "AJannatLT",
      // primaryColor: isDarkTheme ? Colors.white :Colors.black,
      scaffoldBackgroundColor: isDarkTheme ? Colors.black :backgroundColor,
      backgroundColor:
          isDarkTheme ? Color(0xff343434) : Colors.white.withOpacity(.20),
      indicatorColor: isDarkTheme ? Color(0xff0B0B0B) : Color(0xffDDDDDD),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: isDarkTheme ? kMainColor : Color(0xffF9F9F9)),

      primaryColor: isDarkTheme ? Color(0xff1A1A1A) :kOpacityBlackColor,
      dividerColor: isDarkTheme ? Color(0xff343434) : Color(0xffD9D9D9),
      appBarTheme: AppBarTheme(
        color: isDarkTheme ? Colors.black : Color(0xffF7F4F8),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        iconTheme: IconThemeData(
          color: isDarkTheme ? Color(0xffF9F9F9) : Color(0xff1A1A1A),
        ),
      ),
      colorScheme: ColorScheme.light(
       background: isDarkTheme ? Color(0xff5E5E5E) : Color(0xffDADADA),
        primaryContainer:isDarkTheme ?  Colors.white: Color(0xffAEAEAE) ,
        primary: isDarkTheme ? Color(0xff5E5E5E) : Color(0xffEBE8EB),
        onPrimary: isDarkTheme ? kOpacityBlackColor.withOpacity(0.5)  : Color(0xffE3E1E4),

        //primaryVariant: isDarkTheme ?Color(0xff1A1A1A) : Color(0xf  f929292),
        secondary: isDarkTheme ? Colors.white : Color(0xff929292),
      ),
      cardTheme: CardTheme(
        color: isDarkTheme ? Color(0xffF9F9F9) : Colors.black,
      ),
        accentColor: isDarkTheme ? Color(0xffFFFFFF) :kColorText,
      hoverColor: isDarkTheme ? Color(0xffF2BBFA) : Color(0xff0123FF),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(
            isDarkTheme ? Color(0xffCBCBCB) : Color(0xffCBCBCB)),
        thumbColor: MaterialStateProperty.all(
            isDarkTheme ? Colors.black : Colors.white),
      ),
      cardColor: isDarkTheme ? Color(0xff343434) : Colors.white,
      cursorColor: isDarkTheme ? Color(0xff0B0B0B) : Color(0xffEEEEEE),
      highlightColor: isDarkTheme ?Color(0xffCBCBCB).withOpacity(.5) : Color(0xffEEEEEE),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white : Colors.black,
      ),
      hintColor: isDarkTheme ? Color(0xffFFFFFF) : Color(0xff5E5E5E),
      shadowColor: isDarkTheme ? Colors.black12 : Colors.black12,
      canvasColor: isDarkTheme ? Color(0xffFFFFFF) : Color(0xff1A1A1A),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) : Color(0xff929292),
            fontSize: 14,
            fontWeight: FontWeight.w700),
              headline3: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) : Colors.black,
            fontWeight: FontWeight.w500,

            fontSize: 18),
        headline4: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        subtitle1: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) :kColorText,
            fontSize: 13,
            fontWeight: FontWeight.w400),
        subtitle2: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) :kColorText,
            fontSize: 10,
            fontWeight: FontWeight.w400),
          bodyText1: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15),
          bodyText2: TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) : Colors.black,
            fontSize: 13.5,
            fontWeight: FontWeight.w500),
        caption:   TextStyle(
            color: isDarkTheme ? Color(0xffF9F9F9) : Colors.black,
            fontSize:14,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

///Theme.of(context).textTheme.bodyText2
