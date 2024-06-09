import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../local_storage/shared_preferences/preferences.dart';
import '../../utilities/const.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';
import '../../widget/timings_widget.dart';

class PrayerTimingsScreen extends StatefulWidget {
  const PrayerTimingsScreen({Key? key}) : super(key: key);

  @override
  State<PrayerTimingsScreen> createState() => _PrayerTimingsScreenState();
}

class _PrayerTimingsScreenState extends State<PrayerTimingsScreen> {
  String? isha, maghrib, asr, dhuhr, sunrise, fajr;
  DateTime now = DateTime.now();
  var todayDate = DateFormat("yyyy/MM/dd").format(DateTime.now());
  HijriCalendar _today = HijriCalendar.now();

  mainAdhan() {
    print('My Prayer Times');
    final myCoordinates = Coordinates(
        30.033333, 31.233334); // Replace with your own location lat, lng.
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    print(
        "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
    fajr = DateFormat.jm().format(prayerTimes.fajr);
    sunrise = DateFormat.jm().format(prayerTimes.sunrise);
    dhuhr = DateFormat.jm().format(prayerTimes.dhuhr);
    asr = DateFormat.jm().format(prayerTimes.asr);
    maghrib = DateFormat.jm().format(prayerTimes.maghrib);
    isha = DateFormat.jm().format(prayerTimes.isha);

    print('---');
  }

  @override
  void initState() {
    HijriCalendar.setLocal(HiveController().languageCode);
    mainAdhan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () => Get.back(),
      padding: 18,
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomTextWidget(
                  title: 'Prayer_Timings'.tr,
                  size: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 1.5.h),
            CustomTextWidget(
                title: 'The_city_used_to_show_times_is_Cairo'.tr,
                color: Color(0xff159F1F),
                fontWeight: FontWeight.w400,
                size: 12),
            SizedBox(height: 1.0.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.only(bottom: 15),
              radius: 10,
              widgetContainer: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: secondColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: Row(
                      children: [
                        CustomTextWidget(
                          title: _today.fullDate(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Spacer(),
                        CustomTextWidget(
                          title: todayDate,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  buildRowPrayerTimings(
                      'assets/images/asr.png', 'dhuhr'.tr, 12),
                  CustomTextWidget(
                    title: 'Makkah_Saudi_Arabia'.tr,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 2.0.h),
                  Image.asset('assets/images/compass.png',
                      fit: BoxFit.contain, width: 100),
                ],
              ),
            ),
            SizedBox(height: 1.0.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.only(bottom: 15, top: 15),
              radius: 10,
              widgetContainer: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimingsWidget(
                      title: 'fajr'.tr,
                      time: fajr.toString(),
                      image: 'assets/images/fajr.png',
                      color: now == fajr ? secondColor : Colors.white),
                  buildContainer(context),
                  TimingsWidget(
                      title: 'sunrise'.tr,
                      time: sunrise.toString(),
                      image: 'assets/images/sunrise.png',
                      color: now == sunrise ? secondColor : Colors.white),
                  buildContainer(context),
                  TimingsWidget(
                      title: 'dhuhr'.tr,
                      time: dhuhr.toString(),
                      image: 'assets/images/dhuhr.png',
                      color: now == dhuhr ? secondColor : Colors.white),
                  buildContainer(context),
                  TimingsWidget(
                      title: 'asr'.tr,
                      time: asr.toString(),
                      image: 'assets/images/asr.png',
                      width: 12,
                      color: now == asr ? secondColor : Colors.white),
                  buildContainer(context),
                  TimingsWidget(
                      title: 'maghrib'.tr,
                      time: maghrib.toString(),
                      image: 'assets/images/maghrib.png',
                      color: now == maghrib ? secondColor : Colors.white),
                  buildContainer(context),
                  TimingsWidget(
                      title: 'isha'.tr,
                      time: isha.toString(),
                      image: 'assets/images/isha.png',
                      color: now == isha ? secondColor : Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRowPrayerTimings(String image, String name, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, fit: BoxFit.contain, width: width),
        SizedBox(width: 1.w),
        CustomTextWidget(
          title: name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 1,
      color: Theme.of(context).dividerColor,
    );
  }
}
