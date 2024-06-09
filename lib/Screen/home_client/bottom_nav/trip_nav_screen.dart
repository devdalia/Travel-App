import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/text_filed_shadow_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/build_header_nav_widget.dart';
import '../../../widget/custom_button_widget.dart';
import '../../../widget/custom_text_widget.dart';
import '../details_trip_screen.dart';

class TripNavScreen extends StatefulWidget {
  const TripNavScreen({Key? key}) : super(key: key);

  @override
  State<TripNavScreen> createState() => _TripNavScreenState();
}

class _TripNavScreenState extends State<TripNavScreen> {
  @override
  Widget build(BuildContext context) {
    return BuildHeaderNavWidget(
      title: 'the_trip'.tr,
      widget: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextWidget(
              title: 'Track_registered_traveler'.tr,
              size: 20,
            ),
            SizedBox(height: 5.h),
            buildCustomContainerBoxShadow('ID_No'.tr),
            SizedBox(height: 2.h),
            buildCustomContainerBoxShadow('Birth_date'.tr),
            SizedBox(height: 7.h),
            CustomButtonWidget(
              borderRadius: 18,
              color: [
                Color(0xffB703D3),
                Color(0xff5C026A),
              ],
              width: 53.0.w,
              onClick: () {
                Get.to(DetailsTripScreen());
              },
              title: 'Track_the_flight'.tr,
            ),
            SizedBox(height: 2.h),
            CustomTextWidget(
              title:
                  'You_can_now_track_the_trip_friends_relatives_check_them'.tr,
              textAlign: TextAlign.center,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomContainerBoxShadow(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainerBoxShadow(
          padding: const EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 3),
          width: 35.w,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          widgetContainer: Align(
              alignment: HiveController().languageCode=='en'?Alignment.centerLeft:Alignment.centerRight,
              child: CustomTextWidget(title: title, size: 18 )),
        ),
        TextFiledShadowWidget(
          password: false,
          suffixText: false,
          suffix: false,
          radius: 15,
          width: MediaQuery.of(context).size.width - 80,
          borderOnly: true,
          fillColor: false,
          hint: '',
        ),
      ],
    );
  }
}
