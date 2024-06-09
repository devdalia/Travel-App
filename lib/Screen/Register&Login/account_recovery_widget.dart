import 'package:amwaj_car/controllers/AccountRecovery_controller.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/AppController.dart';
import '../../utilities/const.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_widget.dart';

class AccountRecoveryWidget extends StatefulWidget {
  const AccountRecoveryWidget({Key? key}) : super(key: key);

  @override
  State<AccountRecoveryWidget> createState() => _AccountRecoveryWidgetState();
}

enum Recovery { Equity, Mobile }

class _AccountRecoveryWidgetState extends State<AccountRecoveryWidget> {
  Recovery? _recovery = Recovery.Mobile;
  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: ()=>  AppController.to.type.value = 'login',
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CustomTextWidget(
              title: 'Account_Recovery'.tr,
              size: 25,
              fontWeight: FontWeight.bold),
          SizedBox(height: 2.h),
          CustomContainerBoxShadow(
            padding: EdgeInsets.only(top: 25, bottom: 25),
            colorFill: Theme.of(context).cardColor,
            widgetContainer: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 2.w),
                    Expanded(
                      child: CustomContainerBoxShadow(
                        padding: EdgeInsets.all(2),
                        height: 25.h,
                        widgetContainer: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio<Recovery>(
                                  value: Recovery.Mobile,
                                  groupValue: _recovery,
                                  activeColor: kPrimerColor,
                                  onChanged: (Recovery? value) {
                                    setState(() {
                                      _recovery = value;
                                      AccountRecoveryController.to.mobile.value =
                                      1;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomTextWidget(
                                          title:
                                          'Account_recovery_by_mobile'.tr,
                                          size: 16,
                                          fontWeight: FontWeight.w700),
                                      // CustomTextWidget(
                                      //     title: 'A_text_message_was_sent_to'
                                      //             .tr +
                                      //         '+2  012*****163',
                                      //     size: 11,
                                      //     fontWeight: FontWeight.w300),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio<Recovery>(
                                  value: Recovery.Equity,
                                  groupValue: _recovery,
                                  activeColor: kPrimerColor,
                                  onChanged: (Recovery? value) {
                                    setState(() {
                                      _recovery = value;
                                      AccountRecoveryController
                                          .to.property_rights.value = 1;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                      title: 'Redemption_by_Equity'.tr,
                                      size: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    // SizedBox(width: 2.w),
                    // CustomContainerBoxShadow(
                    //   padding: EdgeInsets.all(15),
                    //   height: 25.h,
                    //   widgetContainer: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Image.asset(
                    //         "assets/images/user.png",
                    //         color: kPrimerColor,
                    //       ),
                    //       CustomTextWidget(
                    //           title: '15788 ',
                    //           size: 16,
                    //           fontWeight: FontWeight.w500),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 5.h),
                GetBuilder<AccountRecoveryController>(

                      init: Get.put(AccountRecoveryController()),
                    builder: (controller) => CustomButtonWidget(
                        width: 47.0.w,
                        height: 55,
                        loading: controller.SelectOptionLoading.value,
                        color: [
                          Color(0xffB003CB),
                          Color(0xff60026F),
                        ],
                        onClick: ()=> controller.SelectOption(context: context),
                        title: "Recovery".tr)),

              ],
            ),
          )
        ],
      ),

    );
  }
}
