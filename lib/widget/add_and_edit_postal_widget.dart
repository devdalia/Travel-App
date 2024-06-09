import 'package:amwaj_car/widget/text_filed_shadow_widget.dart';
import 'package:amwaj_car/widget/widget_container_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/AppController.dart';
import '../local_storage/shared_preferences/preferences.dart';
import 'custom_container_box_shadow.dart';
import 'custom_text_widget.dart';

class AddAndEditPostalWidget extends StatelessWidget {
  const AddAndEditPostalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: Get.put(AppController()),
      builder: (AppController controller) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: CustomContainerBoxShadow(
                padding: EdgeInsets.zero,
                colorFill: Theme.of(context).scaffoldBackgroundColor,
                border: true,
                widgetContainer: Padding(
                  padding:  HiveController().languageCode == 'ar'?const EdgeInsets.only(left: 30,right:5):EdgeInsets.only(right: 30,left: 5),
                  child: Column(
                    children: [
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'mail_type'.tr,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),Spacer(),
                          NewWidgetContainerCustom(
                            text: 'Normal'.tr,
                            radius: 0,
                            colorText: Theme.of(context).cardTheme.color!,
                            onTap: () {
                              ///  Get.to(ConfirmOwnershipNumberScreen());
                            },
                          ),
                          Spacer(),

                          NewWidgetContainerCustom(
                            text: 'fast'.tr,
                            radius: 0,
                            colorText: Theme.of(context).cardTheme.color!,
                            onTap: () {
                              ///  Get.to(ConfirmOwnershipNumberScreen());
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'province'.tr,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(width: 9.w,),
                          Expanded(
                            child: CustomContainerBoxShadow(
                              padding: EdgeInsets.only(left: 15,right: 15),
                                    radius: 10,
                              widgetContainer: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    title: 'Choose_the_delivery_location'.tr,
                                    style: Theme.of(context).textTheme.subtitle2,
                                  ),
                                  Icon(Icons.arrow_drop_down_sharp,color: Theme.of(context).hintColor,size: 35,)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'Recipient'.tr,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(width: 9.w,),
                          Expanded(
                            child:  TextFiledShadowWidget(
                              password: false,
                              suffix : false,
                              radius: 10,
                              hint: 'Enter_the_recipients_full_name'.tr,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'mobile'.tr,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(width: 9.w,),
                          Expanded(
                            child:  TextFiledShadowWidget(
                              password: false,
                              suffixText: true,radius: 10,
                              fillColor: false,
                              hint: 'Recipient_mobile_number'.tr,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          NewWidgetContainerCustom(
                            text: 'add'.tr,
                            radius: 10,
                    choose : controller.typePostalSelect.value == 'add'?true:false,
                            colorText: controller.typePostalSelect.value == 'add'?Theme.of(context).cardTheme.color!:Theme.of(context).dividerColor,
                            onTap: () {
                              controller.typePostalScreen.value='display';
                              controller.typePostalSelect.value='';
                            },
                          ),


                          NewWidgetContainerCustom(
                            text: 'edit'.tr,
                            radius: 10,
                            choose : controller.typePostalSelect.value == 'edit'?true:false,
                            colorText: controller.typePostalSelect.value == 'edit'?Theme.of(context).cardTheme.color!:Theme.of(context).dividerColor,
                            onTap: () {
                              controller.typePostalScreen.value='display';
                              controller.typePostalSelect.value='';
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 8.w,
              top: -2.h,
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.only(left: 25, right: 25),
                child: CustomTextWidget(
                  title: controller.typePostalSelect.value == 'add'
                      ? 'add'.tr
                      : 'edit'.tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
