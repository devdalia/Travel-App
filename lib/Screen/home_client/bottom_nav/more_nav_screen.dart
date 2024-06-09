import 'package:amwaj_car/Screen/more/Prayer_Timings_screen.dart';
import 'package:amwaj_car/Screen/more/change_currency_screen.dart';
import 'package:amwaj_car/Screen/more/contact_us_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../local_storage/shared_preferences/preferences.dart';
import '../../../widget/build_header_nav_widget.dart';
import '../../../widget/custom_container_box_shadow.dart';
import '../../../widget/new_widget_row_icon.dart';

class MoreNavScreen extends StatefulWidget {
  const MoreNavScreen({Key? key}) : super(key: key);

  @override
  State<MoreNavScreen> createState() => _MoreNavScreenState();
}

class _MoreNavScreenState extends State<MoreNavScreen> {
  @override
  Widget build(BuildContext context) {
    return BuildHeaderNavWidget(
      title: 'More'.tr,
      widget: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomContainerBoxShadow(
              padding: EdgeInsets.all(15),
              widgetContainer: Column(
                children: [
                  NewWidgetRowIcon(
                    title: HiveController().languageCode == 'ar'
                        ? 'English'
                        : "لغة عربية",
                    icon: 'assets/images/lang.png',
                    iconArrow: false,
                    onTap: () {
                      if (HiveController().languageCode == 'ar') {
                        HiveController().setLanguage('en');
                        Get.updateLocale(Locale('en', ''));
                      } else if (HiveController().languageCode == 'en') {
                        HiveController().setLanguage('ar');
                        Get.updateLocale(Locale('ar', ''));
                      }
                    },
                  ),
                  SizedBox(height: 2.h),
                  NewWidgetRowIcon(
                    title: 'dark_mode'.tr,
                    icon: 'assets/images/dark_mode.png',
                    iconArrow: true,
                    dark: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'change_currency'.tr,
                    icon: 'assets/images/change_currency.png',
                    iconArrow: true,
                    onTap: () => Get.to(ChangeCurrencyScreen()),
                  ),
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'Prayer_Timings'.tr,
                    icon: 'assets/images/Prayer_Timings.png',
                    iconArrow: true,
                    onTap: () => Get.to(PrayerTimingsScreen()),
                  ),
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'Who_we_are'.tr,
                    icon: 'assets/images/Who_we_are.png',
                    iconArrow: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'Contact_us'.tr,
                    icon: 'assets/images/Contact_us.png',
                    iconArrow: true,
                    onTap: () => Get.to(ContactUsScreen()),
                  ),
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'privacy_policy'.tr,
                    icon: 'assets/images/privacy_policy.png',
                    iconArrow: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'Terms_and_Conditions'.tr,
                    icon: 'assets/images/Terms.png',
                    iconArrow: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 2.5.h),
                  NewWidgetRowIcon(
                    title: 'FAQ'.tr,
                    icon: 'assets/images/faq.png',
                    iconArrow: true,
                    onTap: () {},
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
}
