
import 'package:amwaj_car/widget/build__widget_row_text.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';
import 'build_widget_buy_package.dart';
import 'custom_container_box_shadow.dart';

// ignore: must_be_immutable
class ExchangePackagesWidget extends StatefulWidget {
  ExchangePackagesWidget({Key? key}) : super(key: key);

  @override
  State<ExchangePackagesWidget> createState() => _ExchangePackagesWidgetState();
}

class _ExchangePackagesWidgetState extends State<ExchangePackagesWidget> {
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextWidget(
                    title: 'Exchange_and_non_working_I_have_no_brain_pain'.tr,
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
                        'Subscribe_monthlyFor_30_days_with_deliveries_Up_to_20_moves_and_a_total_amount'
                            .tr,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.w),
            CustomContainerBoxShadow(
              width: 40.w,
              height: 35.h,
              padding: EdgeInsets.only(top: 20),
              radius: 10,
              colorFill: Theme.of(context).colorScheme.onPrimary,
              widgetContainer: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextWidget(
                    title: 'exchange_package'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 2.5.h),
                  Image.asset('assets/images/Arrow-bottom.png',
                      height: 18,
                      width: 70,
                      color: Theme.of(context).hintColor),
                  SizedBox(height: 2.5.h),
                  CustomTextWidget(
                    title: 'Card_cost'.tr + '\n' + '100 ' + 'Point'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 2.h),
                  ContainerBuyPackage(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        CustomTextWidget(
          title: 'Package_history'.tr,
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
                buildRow('10', 'Movements_left'.tr),
                Container(color: Color(0xffD9D9D9), height: .5),
                buildRow('\$5000', 'allowed_left'.tr),
              ],
            ),
          ),
        ),
        SizedBox(height: 3.h),
        CustomContainerBoxShadow(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          radius: 10,
          height: 7.h,
          widgetContainer: NewWidgetRowText(
              color: Theme.of(context).iconTheme.color,
              text1: 'Operation_No'.tr,
              text2: 'Sale'.tr,
              text3: 'Buy'.tr,
              text4: 'Date'.tr),
        ),
        SizedBox(height: 1.h),
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: NewWidgetRowText(
              text1: '45331#',
              text2: '\$ 200',
              text3: '3000ج.م',
              text4: '8/2/2022'),
        ),
      ],
    );
  }

  Row buildRow(String value, String title) {
    return Row(
      children: [
        SizedBox(
          width: 13.w,
          child: CustomTextWidget(
            title: value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Container(
          color: Color(0xffD9D9D9),
          height: 5.h,
          width: .5,
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
