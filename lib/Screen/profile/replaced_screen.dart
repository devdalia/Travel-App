import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/new_widget_build_tab.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:amwaj_car/widget/order_status_widget.dart';
import 'package:amwaj_car/widget/request_refund_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReplacedScreen extends StatefulWidget {
  const ReplacedScreen({Key? key}) : super(key: key);

  @override
  State<ReplacedScreen> createState() => _ReplacedScreenState();
}

class _ReplacedScreenState extends State<ReplacedScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () => Get.back(),
      widget: Column(
        children: [
          SizedBox(height: 3.h),
          CustomContainerBoxShadow(
            padding: EdgeInsets.zero,
            radius: 10,
            height: 8.5.h,
            widgetContainer: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NewWidgetBuildTab(
                    title: 'Request_refund'.tr,
                    width: 25.w,
                    choose: index == 0 ? true : false,
                    color: Color(0xff0123FF),
                    click: () {
                      setState(() {
                        index = 0;
                      });
                    },
                  ),
                  NewWidgetBuildTab(
                    title: 'Order_Status'.tr,
                    width:
                        HiveController().languageCode == 'en' ? 29.2.w : 25.w,
                    choose: index == 1 ? true : false,
                    color: Color(0xff0123FF),
                    click: () {
                      setState(() {
                        index = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 3.h),
          if (index == 0) RequestRefundWidget(),
          if (index == 1) OrderStatusWidget(),
        ],
      ),
    );
  }
}
