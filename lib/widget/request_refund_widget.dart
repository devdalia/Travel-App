import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../controllers/User_controller.dart';
import 'custom_text_widget.dart';

class RequestRefundWidget extends StatefulWidget {
  const RequestRefundWidget({Key? key}) : super(key: key);

  @override
  State<RequestRefundWidget> createState() => _RequestRefundWidgetState();
}

class _RequestRefundWidgetState extends State<RequestRefundWidget> {


  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: Get.put(UserController()),
      builder: (UserController controller){
        var data = controller.allDataWalletUserModel?.data;
        return Column(
          children: [
            buildRow('recently_recovered'.tr ,
                '  ${data?.redeemedPoints.toString() ?? ''}'),
            SizedBox(height: 1.5.h),
            buildRow('Reserved_waiting'.tr,
                '  ${data?.countReservedPoints.toString() ?? ''}'),
            SizedBox(height: 1.5.h),
            buildRow('Allowed_to_be_replaced'.tr,
                '  ${data?.countAllowedRedeemedPoints.toString() ?? ''}'),
            SizedBox(height: 5.5.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.all(20),
              radius: 10,
              widgetContainer: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      buildExpanded(
                          'Required_point'.tr,
                          controller.redeemed_points_countController,
                          false),
                      SizedBox(width: 2.w),
                      buildExpanded('Dollar_value'.tr, null, true),
                      SizedBox(width: 1.5.w),
                      Image.asset(
                        'assets/images/refund.png',
                        width: 15,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 1.5.w),
                      InkWell(
                        onTap: ()=>controller.redeemRequest(context: context),
                        child: CustomContainerBoxShadow(
                          height: 7.h,
                          padding: EdgeInsets.all(0),
                          width: 28.w,
                          radius: 5,
                          widgetContainer:controller.redeemRequestLoading.value? Center(
                            child: LoadingAnimationWidget.fallingDot(
                              color:kMainColor,
                              size: 50,
                            ),
                          ): Center(
                            child: CustomTextWidget(
                              title: 'Request_refund'.tr,
                              size: 12,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).cardTheme.color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        title: 'disclaimer'.tr,
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                      Expanded(
                        child: CustomTextWidget(
                          title: 'The_refund_request_will_be_reviewed'.tr,
                          size: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).cardTheme.color,
                        ),
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    title:
                    'It_is_approved_within_48_hours_after_the_application_process'
                        .tr,
                    size: 14,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).cardTheme.color,
                  ),
                ],
              ),
            ),
          ],
        );
      },

    );
  }

  Widget buildExpanded(
      String text, TextEditingController? textEditingController, bool read) {
    return Expanded(
      child: Container(
        height: 10.h,
        width: 20.w,
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).accentColor, width: 1.2),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 5.h,
              child: CustomTextField(
                textAlign: TextAlign.center,
                max: 1,
                fillColor: Theme.of(context).backgroundColor,
                textColor: Theme.of(context).accentColor,
                borderRadius: 0,
                keyboardType: TextInputType.number,
                read: read,
                textEditingController: textEditingController,
              ),
            ),
            Container(
              height: 4.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).indicatorColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  )),
              child: CustomTextWidget(
                title: text,
                color: Theme.of(context).cardTheme.color,
                size: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String title, String point) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: CustomTextWidget(
              title: title,
              size: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).cardTheme.color,
            ),
          ),
          CustomTextWidget(
            title: point+' ' + 'Point'.tr,
            size: 16,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).cardTheme.color,
          ),
        ],
      ),
    );
  }
}
