import 'package:amwaj_car/widget/Confirm_reservations_widget.dart';
import 'package:amwaj_car/widget/Passenger_Payments_widget.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/new_widget_build_tab.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:amwaj_car/widget/showDialog.dart';
import 'package:amwaj_car/widget/text_filed_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/Driver_controller.dart';
import '../../utilities/const.dart';
import '../../widget/check_box.dart';
import '../../widget/custom_button_widget.dart';

class PassengerPanelScreen extends StatefulWidget {
  const PassengerPanelScreen({Key? key}) : super(key: key);

  @override
  State<PassengerPanelScreen> createState() => _PassengerPanelScreenState();
}

class _PassengerPanelScreenState extends State<PassengerPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (logic) {
        return NewWidgetHeaderScreen(
          onClickLeading: () => Get.back(),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainerBoxShadow(
                padding: EdgeInsets.zero,
                radius: 10,
                height: 7.5.h,
                widgetContainer: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NewWidgetBuildTab(
                        title: 'Confirm_reservations'.tr,
                        choose: logic.index.value == 0 ? true : false,
                        width: 25.w,
                        click: () {
                          logic.changeIndex(0);
                        },
                      ),
                      NewWidgetBuildTab(
                        title: 'Passenger_Payments'.tr,
                        choose: logic.index.value == 1 ? true : false,
                        width: 25.w,
                        click: () {
                          logic.changeIndex(1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              if (logic.index.value == 0) ConfirmReservationsWidget(),
              if (logic.index.value == 1) PassengerPaymentsWidget(),


            ],
          ),
        );
      },
    );
  }

  Widget BuildTabs(String title, bool choose, Function() click) {
    return InkWell(
      onTap: click,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextWidget(
            title: title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: choose == true ? 1.h : 1.5.h),
          if (choose == true)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 1.5,
                width: 25.w,
                color: Colors.red,
              ),
            )
        ],
      ),
    );
  }
}
