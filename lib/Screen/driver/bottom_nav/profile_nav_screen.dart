import 'dart:io';

import 'package:amwaj_car/Screen/splash/splash_screen.dart';
import 'package:amwaj_car/controllers/Driver_controller.dart';
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/helpers/binding.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/AppController.dart';
import '../../../utilities/const.dart';
import '../../../widget/build_header_nav_widget.dart';
import '../../../widget/custom_container_box_shadow.dart';
import '../../../widget/custom_text_widget.dart';
import '../../../widget/new_widget_row_icon.dart';
import '../../../widget/showDialog.dart';
import '../../profile/documents_screen.dart';
import '../../profile/my_wallet_screen.dart';
import '../../profile/password_change_screen.dart';

class ProfileDriverNavScreen extends StatefulWidget {
  const ProfileDriverNavScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDriverNavScreen> createState() => _ProfileDriverNavScreenState();
}

class _ProfileDriverNavScreenState extends State<ProfileDriverNavScreen> {
  @override
  Widget build(BuildContext context) {
    return BuildHeaderNavWidget(
      title: 'profile'.tr,
      widget: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GetBuilder<DriverController>(
              init: DriverController(),
              builder: (logic) {
                if (logic.DriverProfileLoading.value) {
                  return LoadingWidget();
                }
                var data = logic.driverProfile.data;
                return CustomContainerBoxShadow(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 4, right: 5, left: 5),
                  widgetContainer: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildColumn('Name'.tr, data?.name ?? ""),
                            SizedBox(width: 5.w),
                            buildColumn(
                                'Passport_No'.tr, data?.passportNum ?? ''),
                            SizedBox(width: 5.w),
                            CachedNetworkImage(
                              height: 10.0.h,
                              width: 10.0.w,
                              ///  color: Colors.red,
                              fit: BoxFit.contain,
                              placeholder: (context, url) =>
                              const CircleAvatar(
                                radius: 37,
                              ),
                              imageUrl: imageUrl + (data?.image?.url??""),
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                      'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG.png'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: .5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildColumn('Birth_date'.tr, data?.birthDate ?? ""),
                            SizedBox(width: 5.w),
                            buildColumn('Passport_Expiry_Date'.tr,
                                data?.endDatePassport ?? ""),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextWidget(
                                    title: 'ID_No'.tr,
                                    style:
                                        Theme.of(context).textTheme.headline2),
                                CustomTextWidget(
                                    title: data?.personalId ?? "",
                                    style:
                                        Theme.of(context).textTheme.headline2),
                              ],
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: ()=>updateImageProfileDialog(context: context),
                        child: Image.asset(
                          'assets/images/edit.png',
                          fit: BoxFit.contain,
                          width: 20,
                          color: Theme.of(context).hoverColor,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 2.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.all(15),
              widgetContainer: Column(
                children: [
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'My_wallet'.tr,
                    icon: 'assets/images/My_wallet.png',
                    iconArrow: true,
                    onTap: () => Get.to(MyWalletScreen()),
                  ),
                  buildContainer(),
                  SizedBox(height: 2.h),
                  NewWidgetRowIcon(
                    title: 'Password_change'.tr,
                    icon: 'assets/images/lock.png',
                    iconArrow: true,
                    onTap: () => Get.to(PasswordChangeScreen()),
                  ),
                  buildContainer(),
                  SizedBox(height: 6.5.h),
                  NewWidgetRowIcon(
                    title: 'Exit'.tr,
                    icon: 'assets/images/Exit.png',
                    iconArrow: true,
                    onTap: () {
                      HiveController().logout();

                      Get.offAll(SplashScreen(), binding: Binding());
                      AppController.to.login.value = 'no';
                      UserController.to.logout();
                    },
                  ),
                  SizedBox(height: 2.5.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildColumn(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
            title: title, style: Theme.of(context).textTheme.bodyText2),
        Container(
          height: 1.5,
          width: 23.w,
          color: kColorText,
        ),
        SizedBox(
          width: 23.w,
          child: CustomTextWidget(
              title: text, style: Theme.of(context).textTheme.bodyText2),
        ),
      ],
    );
  }

  Container buildContainer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      height: 1,
      color: Color(0xffF2F2F2),
    );
  }
}
