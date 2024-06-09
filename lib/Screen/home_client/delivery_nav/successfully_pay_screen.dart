import 'package:amwaj_car/Screen/home_client/home_screen.dart';
import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_text_widget.dart';

class SuccessfullyPayScreen extends StatelessWidget {
  const SuccessfullyPayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomContainerBoxShadow(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.all(25),
              radius: 20,
              widgetContainer: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/check-color.png',
                          width: 80, height: 80, fit: BoxFit.contain),
                      CustomTextWidget(
                        title: 'Seat_ticket_paid'.tr,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      CustomTextWidget(
                        title: 'for_traveler'.tr + ' \tYoussef Hafez',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              AppController.to.changeIndex(4);
                              Get.off(HomeScreen());
                            },
                            child: CustomContainerBoxShadow(
                              width: 112,
                              height: 48,
                              radius: 28,
                              colorFill: Color(0xffFCEAFF),
                              padding: EdgeInsets.zero,
                              widgetContainer: Center(
                                child: CustomTextWidget(
                                  title: "okay".tr,
                                  size: 18,
                                  color:Colors.black,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              AppController.to.changeIndex(3);
                              Get.off(HomeScreen());
                            },
                            child: CustomContainerBoxShadow(
                              width: 112,
                              height: 48,
                              radius: 28,
                              colorFill: Color(0xffFCEAFF),
                              padding: EdgeInsets.zero,
                              widgetContainer: Center(
                                child: CustomTextWidget(
                                  title: "Flight_view".tr,
                                  size: 18,
                                  color:Colors.black,
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
