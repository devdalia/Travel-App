import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../controllers/User_controller.dart';
import 'build__widget_row_text.dart';
import 'custom_text_widget.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: Get.put(UserController()),
        builder: (dataGet) {
          if (dataGet.allDataLoading.value == true) {
            return Center(
              child: LoadingAnimationWidget.halfTriangleDot(
                color: kMainColor,
                size: 100,
              ),
            );
          } else if (dataGet
              .allDataWalletUserModel!.data!.getAllRedeemRequests!.isEmpty) {
            return Center(
              child: CustomTextWidget(
                title: 'No_replacement_requests'.tr,
                size: 15,
                textAlign: TextAlign.center,
                color: kMainColor,
                //  style: Theme.of(context).textTheme.bodyText2,
              ),
            );
          }
          return Column(
            children: [
              NewWidgetRowText(
                  color: Theme.of(context).iconTheme.color,
                  text1: 'Operation_No'.tr,
                  text2: 'points'.tr,
                  text3: 'Date'.tr,
                  text4: 'Status'.tr),
              SizedBox(height: 1.5.h),
              Container(
                height: 1.3,
                width: double.infinity,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(height: 2.h),
              ListView.builder(
                  itemCount: dataGet.allDataWalletUserModel?.data
                      ?.getAllRedeemRequests?.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var model = dataGet.allDataWalletUserModel?.data
                        ?.getAllRedeemRequests?[index];
                    String date = model?.createdAt ?? '';


                    DateTime parseDate = new DateFormat("yyyy-MM-dd").parse(date);
                    var inputDate = DateTime.parse(parseDate.toString());
                    var outputFormat = DateFormat("yyyy-MM-dd");
                    var outputDate = outputFormat.format(inputDate);
                    print(outputDate);
                    return Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomContainerBoxShadow(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        radius: 0,
                        height: 6.5.h,
                        widgetContainer: NewWidgetRowText(
                            color: Theme.of(context).iconTheme.color,
                            text1: '${model?.operationNum}#',
                            text2: model?.redeemedPointsCount,
                            text3: outputDate.toString(),
                            text4: model?.status == 'Accepted'
                                ? 'Acceptable'.tr
                                : model?.status == 'Pending'
                                    ? 'under_review'.tr
                                    : model?.status == 'Returned'
                                        ? 'recovered'.tr
                                        : model?.status),
                      ),
                    );
                  }),
            ],
          );
        });
  }
}
