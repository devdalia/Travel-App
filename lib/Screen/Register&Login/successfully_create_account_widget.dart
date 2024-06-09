import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/helpers/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/AppController.dart';
import '../../utilities/const.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_widget.dart';
import '../home_client/home_screen.dart';

class SuccessfullyCreateAccountWidget extends StatefulWidget {
  const SuccessfullyCreateAccountWidget({Key? key}) : super(key: key);

  @override
  State<SuccessfullyCreateAccountWidget> createState() =>
      _SuccessfullyCreateAccountWidgetState();
}

class _SuccessfullyCreateAccountWidgetState
    extends State<SuccessfullyCreateAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 7.h),
            CustomContainerBoxShadow(
              width: double.infinity,
              alignment: Alignment.center,
              padding:
                  EdgeInsets.only(top: 30, bottom: 40, left: 20, right: 20),
              widgetContainer: Column(
                children: [
                  Image.asset(
                    "assets/images/successfl.png",
                    fit: BoxFit.contain,
                    width: 120,
                  ),
                  SizedBox(height: 2.5.h),
                  CustomTextWidget(
                      title: 'Your_account_has_been_successfully_created'.tr,
                      size: 20,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 1.5.h),
                  CustomTextWidget(
                      title: 'Your_ID_No'.tr,
                      size: 18,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 1.5.h),
                  Text(
                    UserController.to.personal_id.value,
                    style: TextStyle(
                        fontSize: 18,
                        color: kMainColor,
                        decoration: TextDecoration.underline,
                        letterSpacing: 2.5),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            CustomButtonWidget(
                width: 47.0.w,
                color: [
                  Color(0xff21BF2D),
                  Color(0xff21BF2D),
                ],
                height: 55,
                onClick: () {
                  Get.offAll(HomeScreen(),binding: Binding());
                  AppController.to.type.value = 'login';
                },
                title: "Login".tr),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
