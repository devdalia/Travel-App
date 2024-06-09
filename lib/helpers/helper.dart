import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:amwaj_car/widget/build_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/custom_text_widget.dart';

class Helper {
  static String getDescription(String? desc) {
    if (desc == null || desc.isEmpty) return '';
    if (desc.length > 20)
      return desc.substring(0, 20) + '...';
    else
      return desc;
  }

  static launchYoutubeURL({required String url}) async {
    log(url);
    if (Platform.isIOS) {
      if (await canLaunch('youtube://$url')) {
        await launch('youtube://$url', forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      final urlLaunch = '$url';
      if (await canLaunch(urlLaunch)) {
        await launch(urlLaunch);
      } else {
        throw 'Could not launch $urlLaunch';
      }
    }
  }

  static launchURL({required String url}) async {
    log(url);
    final urlLaunch = '$url';
    if (await canLaunch(urlLaunch)) {
      await launch(urlLaunch,
          forceSafariVC: true, enableJavaScript: true, forceWebView: true);
    } else {
      throw 'Could not launch $urlLaunch';
    }
  }

  static launchWhatsApp({required String url}) async {
    log(url);
    final urlLaunch = '$url';
    if (await canLaunch(urlLaunch)) {
      await launch(urlLaunch);
    } else {
      throw 'Could not launch $urlLaunch';
    }
  }

  static void showSnackBar(
    BuildContext context, {
    required String text,
    bool error = false,
    String? actionTitle,
    Function()? onPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextWidget(
          title: text,
          color: Colors.white,
          textAlign: TextAlign.left,
          size: 12,
        ),
        backgroundColor: error ? Colors.red : Color(0xff717A8B),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(15),
        elevation: 5,
        duration: Duration(seconds: 3),
        action: actionTitle != null
            ? SnackBarAction(
                onPressed: onPressed ?? () {},
                label: actionTitle,
                textColor: Colors.yellow,
              )
            : null,
        onVisible: () {
          print('VISIBLE - SNACKBAR');
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.zero,
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.zero)),
        // padding: EdgeInsets.all(15),
      ),
    );
  }

  static void changeDateDialog(
      {required BuildContext context,
      required String type,
      required DateTime initTime,
      required ValueChanged<DateTime> onChange}) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Theme(
          data: ThemeData(canvasColor: Colors.transparent),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: Material(
                child: Container(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: type == 'time'
                        ? CupertinoDatePickerMode.time
                        : CupertinoDatePickerMode.date,
                    onDateTimeChanged: onChange,
                    initialDateTime: initTime,
                  ),
                ),
              ),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  static String dateToString(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  static DateTime stringToDate(String date, String format) {
    final formatter = DateFormat(format);
    final dateTimeFromStr = formatter.parse(date);
    return dateTimeFromStr;
  }

  static String millisToMinutesAndSeconds(millis) {
    var minutes = (millis / 1000) / 60;
    var seconds = (millis / 1000) % 60;
    log('minutes=>$minutes : seconds=>$seconds');
    return '$minutes : $seconds';
  }

  static void showMessageDialog(
      {required BuildContext context,
      required title,
      required bool error,
      Function()? onClick}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: 'label',
        pageBuilder: (_, __, ___) {
          return BuildMessageWidget(
            title: title,
            error: error,
            onClick: onClick,
          );
        });
  }

  static String generateRandomString(int len) {
    var r = math.Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  static Future<XFile?> selectImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 40);
    return pickedFile;
  }
}
