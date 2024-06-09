import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';
import 'custom_text_widget.dart';

class DisplayBookingWidget extends StatefulWidget {
  const DisplayBookingWidget({Key? key}) : super(key: key);

  @override
  State<DisplayBookingWidget> createState() => _DisplayBookingWidgetState();
}

class _DisplayBookingWidgetState extends State<DisplayBookingWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15,bottom: 15),
          color:Theme.of(context).dividerColor,
          width: double.infinity,
          height: 1,
        ),
        SizedBox(height: 3.h),
        buildColumn('Seat_Reservation'.tr),
        SizedBox(height: 3.h),
        buildColumn('Comfortable_booking'.tr),
        SizedBox(height: 3.h),
        buildColumn('VIP_booking'.tr),
      ],
    );
  }

  Column buildColumn(String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15,bottom: 15),
              color:Theme.of(context).cardTheme.color,
              width:2.5,
              height: 3.h,
            ),
            SizedBox(width:2.w),
            CustomTextWidget(
              title: title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        CustomTextWidget(
          title: 'description_booking'.tr,
          style: Theme.of(context).textTheme.caption,
          textAlign:HiveController().languageCode == 'en' ?TextAlign.left: TextAlign.right,
        ),
      ],
    );
  }
}
