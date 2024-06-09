import 'package:amwaj_car/Screen/driver/call_panel_screen.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_container_topshadow_to_bottom_widget.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../passenger_panel_screen.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({Key? key}) : super(key: key);

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      'passenger_panel'.tr,
      'fuel_panel'.tr,
      'call_panel'.tr,
    ];
    List<List<Color>> listColor = [
      [
        Color(0xff810A93),
        Color(0xff7C86DC),
      ],
      [
        Color(0xffFF0000),
        Color(0xffFFB300),
      ],
      [
        Color(0xff21BF2D),
        Color(0xffF7FF00),
      ],
    ];
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(titleList.length, (index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                Get.to(PassengerPanelScreen());
              } else if (index == 1) {
                //     Get.to(PostalScreen());
              } else if (index == 2) {
                Get.to(CallPanelScreen());
              }
            },
            child: Stack(
              children: [
                CustomContainerTopShadowToBottom(
                  title: titleList[index],
                  height: 12.h,
                  textColor: Colors.white,
                  listColor: listColor[index],
                  begin: index == 2
                      ? Alignment.bottomCenter
                      : Alignment.topCenter,
                  end: index == 2
                      ? Alignment.topCenter
                      : Alignment.bottomCenter,
                ),
                if (index == 1)
                  Align(
                    alignment: HiveController().languageCode == 'ar'
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: CustomContainerBoxShadow(
                      padding: EdgeInsets.zero,
                      width: 13.5.w,
                      height: 4.2.h,
                      borderRadius: HiveController().languageCode == 'ar'
                          ? BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      )
                          : BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      colorFill: Colors.red,
                      radius: 14,
                      widgetContainer: Center(
                        child: CustomTextWidget(
                          title: 'soon'.tr,
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }));
  }
}
