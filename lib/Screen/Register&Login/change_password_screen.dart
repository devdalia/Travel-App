import 'package:amwaj_car/Screen/home_client/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/AccountRecovery_controller.dart';
import '../../controllers/AppController.dart';
import '../../helpers/binding.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';
import '../../widget/text_filed_shadow_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountRecoveryController>(
        init: Get.put(AccountRecoveryController()),
        builder: (controller) =>NewWidgetHeaderScreen(
      onClickLeading: () {
        AppController.to.login.value = 'no';
        AppController.to.changeIndex(1);
        Get.offAll(HomeScreen(), binding: Binding());
      },
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextWidget(
                title: 'Password_change'.tr,
                size: 25,
                fontWeight: FontWeight.w500),
            SizedBox(height: 5.h),
            TextFiledShadowWidget(
              password: false,
              hint: 'ID_No'.tr,
              read: true,
              suffix: false,
              controller:    controller.passport_numController,
            ),
            SizedBox(height: 2.h),
            TextFiledShadowWidget(
              password: true,
              hint: 'New_Password'.tr,
              controller: controller.passwordController,
            ),
            SizedBox(height: 2.h),
            TextFiledShadowWidget(
              password: true,
              hint: 'confirm_password'.tr,
              controller: controller.password_confirmationController,
            ),
            SizedBox(height: 2.h),
            SizedBox(height: 10.h),
            CustomButtonWidget(
                width: 47.0.w,
                height: 55,
                color: [
                  Color(0xffB003CB),
                  Color(0xff60026F),
                ],
                loading: controller.resetPasswordLoading.value,
                onClick: () =>controller.resetPassword(context: context),
                title: "A_change".tr),
          ],
        ),
      ),
    ));
  }
}
