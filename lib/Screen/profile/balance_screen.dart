import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/loading_widget.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/User_controller.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: Get.put(UserController()),
      builder: (UserController controller) {
        var data = controller.allDataWalletUserModel?.data;
        if (controller.allDataLoading.value) {
          return LoadingWidget();
        }
        return NewWidgetHeaderScreen(
          onClickLeading: () => Get.back(),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextWidget(
                title: 'Balance'.tr,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 3.h),
              CustomContainerBoxShadow(
                width: double.infinity,
                radius: 10,
                // height: 25.h,
                borderRadius: HiveController().languageCode == 'ar'
                    ? BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                padding: EdgeInsets.zero,
                widgetContainer: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextWidget(
                            title: 'Points_in_the_wallet'.tr,
                            size: 20,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Theme.of(context).accentColor,
                          ),
                          CustomTextWidget(
                            title: 'Total_bookings'.tr,
                            size: 20,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Theme.of(context).accentColor,
                          ),
                          CustomTextWidget(
                            title: 'Total_Payments'.tr,
                            size: 20,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CustomContainerBoxShadow(
                        radius: 0,

                        /// height: 25.h,
                        padding: EdgeInsets.zero,
                        colorFill: Theme.of(context).hintColor,
                        widgetContainer: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25.h,
                              width: 1.5,
                              color: Theme.of(context).accentColor,
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomTextWidget(
                                    title: data?.totalMyPointsOriginalWallet
                                            .toString() ??
                                        '',
                                    size: 18,
                                    color: Theme.of(context).cardColor,
                                  ),
                                  CustomTextWidget(
                                    title:
                                        data?.countReservedPoints.toString() ??
                                            '',
                                    size: 18,
                                    color: Theme.of(context).cardColor,
                                  ),
                                  CustomTextWidget(
                                    title: data?.myPayments.toString() ?? '',
                                    size: 18,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Container(
                              height: 25.h,
                              width: 1.5,
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
