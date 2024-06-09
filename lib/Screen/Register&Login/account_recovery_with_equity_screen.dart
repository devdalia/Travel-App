
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/showDialog.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/AccountRecovery_controller.dart';
import '../../utilities/const.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/text_filed_shadow_widget.dart';

class AccountRecoveryWithEquityScreen extends StatefulWidget {
  const AccountRecoveryWithEquityScreen({Key? key}) : super(key: key);

  @override
  State<AccountRecoveryWithEquityScreen> createState() =>
      _AccountRecoveryWithEquityScreenState();
}

class _AccountRecoveryWithEquityScreenState
    extends State<AccountRecoveryWithEquityScreen> {
  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () => Get.back(),
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
                title: 'Redemption_by_Equity'.tr,
                size: 14,
                fontWeight: FontWeight.w300),
            SizedBox(height: 3.h),
            CustomTextWidget(
                title:
                    'In_preserve_to_preserve_your_privacy_and_the_privacy_of_others_on_the_system'
                        .tr,
                size: 16,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400),
            SizedBox(height: 5.h),
            buildRowContainer(
                '1', 'Send_front_photo_with_the_travel_document_attached'.tr),
            SizedBox(height: 1.5.h),
            InkWell(
              onTap: ()=>imagePickerDialog(
                context: context, type:'recovery',
              ),
              child: CustomContainerBoxShadow(
                  radius: 28,
                  width: 70.w,
                  padding: EdgeInsets.zero,
                  widgetContainer: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: CustomTextWidget(
                            title: 'travel_document_photo'.tr,
                            size: 13,
                            color: kColorText),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffDDDDDD),
                            borderRadius: HiveController().languageCode == 'ar'
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(28),
                                    topLeft: Radius.circular(28),
                                  )
                                : BorderRadius.only(
                                    bottomRight: Radius.circular(28),
                                    topRight: Radius.circular(28),
                                  )),
                        child: NewWidgetIconLine(
                          line: false,
                          suffixIcon: "assets/images/upload-cloud.png",
                          type: 'Icon',
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 2.5.h),
            buildRowContainer('2',
                'Enter_the_travel_document_number_registered_in_the_system'.tr),
            SizedBox(height: 1.5.h),
            TextFiledShadowWidget(
              width: 70.w,
              hint: 'Travel_document_number'.tr,
              suffix: false,
              keyboardType: TextInputType.number,
              controller: AccountRecoveryController.to.passport_numPropertyRightsController,
            ),
            SizedBox(height: 2.5.h),
            buildRowContainer('3', 'Enter_New_Recovery_Mobile_Number'.tr),
            SizedBox(height: 1.5.h),
            TextFiledShadowWidget(
              width: 70.w,
              hint: 'Mobile_No'.tr,
              suffixText: true,
              controller: AccountRecoveryController.to.phone_noController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 7.h),
            GetBuilder<AccountRecoveryController>(
                init: Get.put(AccountRecoveryController()),
                builder: (controller) => CustomButtonWidget(
                    width: 55.0.w,
                    height: 55,
                    loading: controller.propertyRightsLoading,
                    color: [
                      Color(0xffB003CB),
                      Color(0xff60026F),
                    ],
                    borderRadius: 15,
                    onClick: () => controller.PropertyRights(context: context),
                    title: "Send".tr)),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget buildRowContainer(String number, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          width: 37,
          height: 37,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.2, 0.2),
                  blurRadius: 10,
                  color: Theme.of(context).shadowColor),
            ],
          ),
          child: CustomTextWidget(
              title: number,
              size: 18,
              color: kMainColor,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 2.5.w),
        Expanded(
          child: CustomTextWidget(
              title: text, size: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
