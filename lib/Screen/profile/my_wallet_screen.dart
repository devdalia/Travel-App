import 'package:amwaj_car/Screen/profile/balance_screen.dart';
import 'package:amwaj_car/Screen/profile/replaced_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/User_controller.dart';
import '../../utilities/const.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  var controller = UserController.to.allDataWalletUserModel?.data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (UserController controller) {
        var data = UserController.to.allDataWalletUserModel?.data;
        return NewWidgetHeaderScreen(
          onClickLeading: () => Get.back(),
          padding: 18,
          widget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                    title: 'My_wallet'.tr,
                    size: 20,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 3.h),
                CustomContainerBoxShadow(
                  padding: EdgeInsets.all(25),
                  widgetContainer: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.2, 0.2),
                                    blurRadius: 7,
                                    color: Theme.of(context).shadowColor),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: CustomTextWidget(title: '0%', size: 7),
                          ),
                          Expanded(
                            child: Container(
                              height: 1.5.h,
                              color: Theme.of(context).indicatorColor,
                            ),
                          ),
                          Image.asset('assets/images/prime.png',
                              fit: BoxFit.contain, width: 30),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            title: 'user'.tr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          CustomTextWidget(
                            title: 'Prime'.tr,
                            size: 12,
                            color: Color(0xffDABF03),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      CustomContainerBoxShadow(
                        width: double.infinity,
                        radius: 5,
                        colorFill: Theme.of(context).cursorColor,
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        widgetContainer: Center(
                          child: CustomTextWidget(
                            title:
                                'تحتاج الى 1,000 نقطة ( حجزان ) لتكون عميل برايم',
                            size: 12,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    buildContainerRow(
                        'replaced'.tr,
                        controller.allDataLoading.value
                            ? '0'
                            : data?.redeemedPoints?.toString() ?? "",
                        'assets/images/My_wallet.png',
                        () => Get.to(ReplacedScreen())),
                    SizedBox(width: 7.w),
                    buildContainerRow(
                        'Balance'.tr,
                        controller.allDataLoading.value
                            ? '0'
                            : data?.totalMyPointsOriginalWallet.toString() ??
                                '',
                        'assets/images/My_wallet.png',
                        () => Get.to(BalanceScreen())),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildContainerRow(
      String title, String subTitle, String image, Function() click) {
    return Expanded(
      child: InkWell(
        onTap: click,
        child: CustomContainerBoxShadow(
          width: 40.w,
          padding: EdgeInsets.all(25),
          widgetContainer: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.contain,
                    width: 15,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  CustomTextWidget(title: title, size: 14),
                ],
              ),
              CustomTextWidget(
                title: subTitle + 'Point'.tr,
                size: 14,
                color: kMainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
