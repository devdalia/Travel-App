
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sizer/sizer.dart';

import 'build_widget_buy_package.dart';
import 'custom_container_box_shadow.dart';

// ignore: must_be_immutable
class SwirlPackagesWidget extends StatefulWidget {
  SwirlPackagesWidget({Key? key}) : super(key: key);

  @override
  State<SwirlPackagesWidget> createState() => _SwirlPackagesWidgetState();
}

class _SwirlPackagesWidgetState extends State<SwirlPackagesWidget> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainerBoxShadow(
          width: 40.w,
          padding: EdgeInsets.only(bottom: 20),
          radius: 10,
          colorFill: Theme.of(context).colorScheme.onPrimary,
          widgetContainer: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContainerBuyPackage(),
              SizedBox(height: 2.h),
              CustomTextWidget(
                title: 'Card_cost'.tr + '\n' + '200 ' + 'Point'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 2.h),
              Image.asset('assets/images/Arrow-top.png',
                  width: 70, color: Theme.of(context).hintColor),
              SizedBox(height: 2.h),
              CustomTextWidget(
                title: 'swirl_bouquet'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: CustomTextWidget(
            title:
                'A_gift_that_will_cheer_you_up_and_make_you_the_strongest_package_Egypt_Buy_the_package_enter_the_monthly_draw_man_prizes'
                    .tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
