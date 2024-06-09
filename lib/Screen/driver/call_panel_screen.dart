import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/new_widget_build_tab.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CallPanelScreen extends StatefulWidget {
  const CallPanelScreen({Key? key}) : super(key: key);

  @override
  State<CallPanelScreen> createState() => _CallPanelScreenState();
}

class _CallPanelScreenState extends State<CallPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: Get.put(AppController()),
      builder: (AppController controller) => NewWidgetHeaderScreen(
        onClickLeading: () => Get.back(),
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.zero,
              radius: 10,
              height: 7.5.h,
              widgetContainer: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NewWidgetBuildTab(
                      title: 'local'.tr,
                      width: 18.w,
                      choose: controller.indexTrip.value == 0 ? true : false,
                      color: Color(0xff0123FF),
                      click: () => controller.changeTripIndex(0),
                    ),
                    NewWidgetBuildTab(
                      title: 'international'.tr,
                      width:
                          HiveController().languageCode == 'en' ? 29.2.w : 18.w,
                      choose: controller.indexTrip.value == 1 ? true : false,
                      color: Color(0xff0123FF),
                      click: () => controller.changeTripIndex(1),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Material(
              color:Theme.of(context).cursorColor,
              elevation: 15,
              shadowColor: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
              child: Column(
                children: [
                  CustomContainerBoxShadow(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    radius: 10,
                    width: double.infinity,
                    widgetContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CustomContainerBoxShadow(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            radius: 12,
                            height: 6.5.h,
                            width: 24.w,
                            widgetContainer: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomTextWidget(
                                  title: '505516',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(width: 2.w),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 25,
                                  color: Theme.of(context).iconTheme.color,
                                )
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(width: 1.5.w),
                        CustomContainerBoxShadow(
                          padding: EdgeInsets.zero,
                          radius: 12,
                          height: 6.5.h,
                          width: 22.w,
                          widgetContainer: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomContainerBoxShadow(
                                padding: EdgeInsets.only(left: 7, right: 7),
                                radius: 12,
                                height: 8.5.h,
                                borderRadius: HiveController().languageCode == 'ar'
                                    ? BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                )
                                    : BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                ),
                                colorFill: Color(0xffDABF03),
                                widgetContainer: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CustomTextWidget(
                                        title: '20',
                                        style: Theme.of(context).textTheme.bodyText2,
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 6.w,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Expanded(
                                      child: CustomTextWidget(
                                        title: '5',
                                        style: Theme.of(context).textTheme.bodyText2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 8.5.h,
                                width: 1.5,
                                color: Theme.of(context).primaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 1, right: 1),
                                child: Container(
                                  height: 8.5.h,
                                  width: 10.w,
                                  alignment: Alignment.center,
                                  child: buildTextFormField('00', 2),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///SizedBox(width: 1.5.w),
                        CustomContainerBoxShadow(
                          padding: EdgeInsets.zero,
                          radius: 12,
                          height:6.5.h,
                          colorFill: Theme.of(context).cardColor,
                          widgetContainer: Flex(
                            ///     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: [
                              Container(
                                height: 8.5.h,
                                width: 23.w,
                                alignment: Alignment.center,
                                child: buildTextFormField(
                                    controller.indexTrip.value == 1
                                        ? '059*******'
                                        : '010********',
                                    10),
                              ),
                              Container(
                                height: 8.5.h,
                                width: 10.w,
                                ///  padding: const EdgeInsets.only(left: 2, right: 2),
                                color: Theme.of(context).colorScheme.primaryContainer,
                                alignment: Alignment.center,
                                child: CustomTextWidget(
                                  title: controller.indexTrip.value == 1?'2+': '972+',
                                  size: 14,
                                  color : Colors.black ,
                                ),
                              ),
                              CustomContainerBoxShadow(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                radius: 12,
                                height: 8.5.h,
                                borderRadius: HiveController().languageCode == 'en'
                                    ? BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                )
                                    : BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                ),
                                colorFill: Color(0xff21BF2D),
                                widgetContainer: Image.asset(
                                  controller.indexTrip.value == 1
                                      ? 'assets/images/tel-call.png'
                                      : 'assets/images/phone-call.png',
                                  width: 15,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 7, bottom: 7),
                        child: CustomContainerBoxShadow(
                          padding: EdgeInsets.all(5),
                          radius: 0,
                          widgetContainer: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                title: '505516',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              CustomTextWidget(
                                title: '10\t' + 'minute'.tr,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              CustomTextWidget(
                                title: controller.indexTrip.value == 1
                                    ? '0594454100'
                                    : '01227799163',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Container(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 50)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField(String hint, int length) {
    return TextFormField(
        cursorColor: kMainColor,
        maxLength: length,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          counterText: "",
          hintText: hint,
          hoverColor: kMainColor,
          focusColor: kMainColor,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        style: TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
        showCursor: true,
        keyboardType: TextInputType.phone);
  }
}
