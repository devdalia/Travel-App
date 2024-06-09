
import 'package:amwaj_car/widget/build__widget_row_text.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';
import 'build_widget_buy_package.dart';
import 'custom_container_box_shadow.dart';

// ignore: must_be_immutable
class ComfortPackagesWidget extends StatefulWidget {
  ComfortPackagesWidget({Key? key}) : super(key: key);

  @override
  State<ComfortPackagesWidget> createState() => _ComfortPackagesWidgetState();
}

class _ComfortPackagesWidgetState extends State<ComfortPackagesWidget> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainerBoxShadow(
              width: 40.w,
              height: 36.h,
              padding: EdgeInsets.only(bottom: 20),
              radius: 10,
              colorFill: Theme.of(context).colorScheme.onPrimary,
              widgetContainer: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerBuyPackage(),
                  SizedBox(height: 3.h),
                  CustomTextWidget(
                    title: 'Card_cost'.tr + '\n' + '200 ' + 'Point'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 2.5.h),
                  Image.asset('assets/images/Arrow-top.png',
                      height: 18,
                      width: 70,
                      color: Theme.of(context).hintColor),
                  SizedBox(height: 2.h),
                  CustomTextWidget(
                    title: 'comfort_package'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextWidget(
                    title:
                        'Your_services_are_ready_You_will_use_wifI_talk_Inter_nationallocal_and_reassurance_your_relatives'
                            .tr,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextWidget(
                    title: 'Subscribe_monthly'.tr,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextWidget(
                    title:
                        '30_days_divided_into_international_minutes_and_local_minutes'
                            .tr,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        CustomTextWidget(
          title: 'call_history'.tr,
          style: Theme.of(context).textTheme.headline3,
        ),
        Align(
          alignment: HiveController().languageCode == 'ar'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: CustomContainerBoxShadow(
            padding: EdgeInsets.zero,
            width: 50.w,
            radius: 15,
            widgetContainer: Column(
              children: [
                buildRow('5', 'International_minute_remaining'.tr),
                Container(color: Color(0xffD9D9D9), height:  .5),
                buildRow('20', 'local_minutes_left'.tr),
              ],
            ),
          ),
        ),
        SizedBox(height: 3.h),
        CustomContainerBoxShadow(
          padding: EdgeInsets.all(5),
          radius: 10,
          height: 7.h,
          widgetContainer: NewWidgetRowText(
              color: Theme.of(context).iconTheme.color,
              text1: 'Contact'.tr,
              text2: 'Mobile_No'.tr,
              text3: 'Minutes'.tr,
              text4: 'Date'.tr),
        ),
        SizedBox(height: 1.h),
        NewWidgetRowText(
            text1: 'international'.tr,
            text2: '+970594454100',
            text3: '3',
            text4: '8/2/2022'),
        SizedBox(height: 1.h),
        NewWidgetRowText(
            text1: 'local'.tr,
            text2: '+970594454100',
            text3: '6',
            text4: '8/2/2022'),
      ],
    );
  }

  Row buildRow(String value, String title) {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
          child: CustomTextWidget(
            title: value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Container(
          color: Color(0xffD9D9D9),
          height: 5.h,
          width:  .5,
        ),
        Expanded(
          child: CustomTextWidget(
            title: title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
