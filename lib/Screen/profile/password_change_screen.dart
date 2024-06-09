import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/custom_text_widget.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({Key? key}) : super(key: key);

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (logic) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          actions: [
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => logic.changePassword(context: context),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: logic.changePasswordLoading.value
                      ? Center(
                          child: LoadingAnimationWidget.fourRotatingDots(
                            color: kMainColor22,
                            size: 30,
                          ),
                        )
                      : CustomTextWidget(
                          title: 'save'.tr,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 18, right: 18, top: 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                    title: 'Password_change'.tr,
                    size: 20,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 2.h),
                CustomContainerBoxShadow(
                  padding: EdgeInsets.all(15),
                  widgetContainer: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Enter_the_old_password'.tr,
                        typeIcon: 'Icon',
                        password: true,
                        border: true,
                        borderRadius: 10,
                        textColor: Theme.of(context).hintColor,
                        fillColor: Colors.white.withOpacity(.20),
                        textEditingController: logic.oldPasswordController,
                        max: 1,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 1.5.h),
                      CustomTextField(
                        hintText: 'Enter_a_new_password'.tr,
                        typeIcon: 'Icon',
                        password: true,
                        border: true,
                        borderRadius: 10,
                        textColor: Theme.of(context).hintColor,
                        fillColor: Colors.white.withOpacity(.20),
                        textEditingController: logic.newPasswordController,
                        max: 1,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 1.5.h),
                      CustomTextField(
                        hintText: 'Confirm_new_password'.tr,
                        typeIcon: 'Icon',
                        password: true,
                        border: true,
                        borderRadius: 10,
                        textColor: Theme.of(context).hintColor,
                        fillColor: Colors.white.withOpacity(.20),
                        textEditingController:
                            logic.confirmationNewPasswordController,
                        max: 1,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
