import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../local_storage/shared_preferences/preferences.dart';
import '../../utilities/const.dart';
import '../../widget/build_radio_custom.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';

class ChangeCurrencyScreen extends StatefulWidget {
  const ChangeCurrencyScreen({Key? key}) : super(key: key);

  @override
  State<ChangeCurrencyScreen> createState() => _ChangeCurrencyScreenState();
}

enum Currency { Shekel, dollar, euro, EGP }

class _ChangeCurrencyScreenState extends State<ChangeCurrencyScreen> {
  Currency? _currency = Currency.dollar;

  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () => Get.back(),
      padding: 18,
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextWidget(
                title: 'change_currency'.tr,
                size: 20,
                fontWeight: FontWeight.w500),
            SizedBox(height: 5.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              widgetContainer: Column(
                children: [
                  BuildRadioCustom(
                      title: 'US_dollar'.tr,
                      subTitle: 'دولار',
                      image: "assets/images/US_dollar.png",
                      widget: Radio<Currency>(
                        value: Currency.dollar,
                        groupValue: _currency,
                        activeColor: kMainColor22,
                        onChanged: (Currency? value) {
                          setState(() {
                            _currency = value;
                          });
                        },
                      )),
                  buildContainer(context),
                  BuildRadioCustom(
                      title: 'european_euro'.tr,
                      subTitle: 'يورو',
                      image: "assets/images/european_euro.png",
                      widget: Radio<Currency>(
                        value: Currency.euro,
                        groupValue: _currency,
                        activeColor: kMainColor22,
                        onChanged: (Currency? value) {
                          setState(() {
                            _currency = value;
                          });
                        },
                      )),
                  buildContainer(context),
                  BuildRadioCustom(
                      title: 'Egyptian_Pound'.tr,
                      subTitle: 'ج.م',
                      image: "assets/images/Egyptian_Pound.png",
                      widget: Radio<Currency>(
                        value: Currency.EGP,
                        groupValue: _currency,
                        activeColor: kMainColor22,
                        onChanged: (Currency? value) {
                          setState(() {
                            _currency = value;
                          });
                        },
                      )),
                  buildContainer(context),
                  BuildRadioCustom(
                      title: 'Palestinian_Shekel'.tr,
                      subTitle: 'ش.ف',
                      image: "assets/images/Palestinian_Shekel.png",
                      widget: Radio<Currency>(
                        value: Currency.Shekel,
                        groupValue: _currency,
                        activeColor: kMainColor22,
                        onChanged: (Currency? value) {
                          setState(() {
                            _currency = value;
                          });
                        },
                      )),
                  buildContainer(context),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            CustomButtonWidget(
                width: 55.0.w,
                height: 50,
                color: [
                  Color(0xff920BA7),
                  Color(0xffA20F0F),
                ],
                borderRadius: 20,
                onClick: () {
                  Get.back();
                },
                title: "Confirm".tr),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: HiveController().languageCode == 'en'
          ? EdgeInsets.only(right: 20)
          : EdgeInsets.only(left: 20),
      height: 1,
      color: Theme.of(context).dividerColor,
    );
  }
}
