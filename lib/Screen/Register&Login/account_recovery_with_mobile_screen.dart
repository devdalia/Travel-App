import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/AccountRecovery_controller.dart';
import '../../utilities/const.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/custom_text_widget.dart';

class AccountRecoveryWithMobileScreen extends StatefulWidget {
  const AccountRecoveryWithMobileScreen({Key? key}) : super(key: key);

  @override
  State<AccountRecoveryWithMobileScreen> createState() =>
      _AccountRecoveryWithMobileScreenState();
}

class _AccountRecoveryWithMobileScreenState
    extends State<AccountRecoveryWithMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountRecoveryController>(
        init: Get.put(AccountRecoveryController()),
          builder: (controller) => NewWidgetHeaderScreen(
              onClickLeading: () {
                Get.back();
              },
              widget: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                        title: 'Account_Recovery'.tr,
                        size: 25,
                        fontWeight: FontWeight.bold),
                    CustomTextWidget(
                        title: 'Account_recovery_by_mobile'.tr,
                        size: 14,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 7.h),
                    controller.sendCode.value == false
                        ? Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                child: CustomTextField(
                                  hintText: 'Passport_No'.tr,
                                  keyboardType: TextInputType.number,
                                  line: true,
                                  max: 1,
                                  textEditingController: controller.passport_numController,
                                  textColor: Theme.of(context).hintColor,
                                  fillColor: Theme.of(context).cardColor,
                                  typeIcon: 'Text',
                                ),
                              ),
                              SizedBox(height: 5.h),
                              CustomButtonWidget(
                                  width: 47.0.w,
                                  height: 55,
                                  loading: controller.forgotPasswordLoading.value,
                                  color: [
                                    Color(0xffB003CB),
                                    Color(0xff60026F),
                                  ],
                                  onClick: () => controller.forgotPassword(context: context),
                                  title: "Send".tr)
                            ],
                          )
                        : Column(
                            children: [
                              CustomTextWidget(
                                  title:
                                      'A_redemption_code_has_been_sent_to_the_number'
                                          .tr,
                                  size: 16,
                                  fontWeight: FontWeight.w400),
                              CustomTextWidget(
                                  title: controller.forgetPassword.data,
                                  size: 16,
                                  fontWeight: FontWeight.w400),
                              CustomTextWidget(
                                  title:
                                      'Please_enter_the_code_to_complete_the_process'
                                          .tr,
                                  size: 16,
                                  fontWeight: FontWeight.w400),
                              SizedBox(height: 7.h),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: SizedBox(
                                 // width: 80.w,
                                  child: PinCodeTextField(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    appContext: context,
                                    length: 6,

                                    keyboardType: TextInputType.number,
                                    autoFocus: true,
                                    obscureText: false,
                                    textStyle:
                                        const TextStyle(color: Colors.black),
                                    animationType: AnimationType.scale,
                                    boxShadows: const [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      )
                                    ],
                                    enableActiveFill: true,
                                    pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(5),
                                        fieldHeight: 7.7.h,
                                        fieldWidth: 12.0.w,
                                        activeFillColor: Colors.white,
                                        inactiveFillColor: Colors.white,
                                        selectedFillColor: Colors.white,
                                        disabledColor: Colors.white,
                                        inactiveColor: Colors.white,
                                        selectedColor: Colors.white,
                                        activeColor: Colors.white),
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    onCompleted: (v) {
                                      controller.code.value=v;
                                    controller.checkCode(context: context);
                                    },
                                    onSubmitted: (v) {
                                      controller.code.value=v;
                                      print('dada');
                                     controller.checkCode(context: context);
                                    },
                                    onChanged: (String value) {},
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              InkWell(
                                onTap: () => controller.forgotPassword(context: context),
                                child: Text(
                                  "Resend_Code".tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: kMainColor,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ));
  }
}
