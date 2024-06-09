import 'package:amwaj_car/Screen/Register&Login/security_code_screen.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/User_controller.dart';
import '../../utilities/const.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/text_filed_shadow_widget.dart';

class CompleteRegisterScreen extends StatefulWidget {
  const CompleteRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CompleteRegisterScreen> createState() =>
      _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState
    extends State<CompleteRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return     GetBuilder<UserController>(
      init: Get.put(UserController()),
      builder: (controller) =>Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Stack(
            children: [
              ListView(
                children: [
                  Align(
                    alignment: HiveController().languageCode == 'en'?Alignment.centerRight:Alignment.centerLeft,
                    child: CustomTextWidget(
                        title: 'step'.tr+'3',
                        size: 15,
                        textAlign: TextAlign.center,
                        color: kMainColor,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomTextWidget(
                      title: 'Create_account'.tr,
                      size: 25,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold),
                  CustomTextWidget(
                      title: 'Please_attach_travel_document_document_complete_registration_process'.tr,
                      size: 14,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w300),

                  SizedBox(height: 5.h),

                  InkWell(
                    onTap: ()=>imagePicker(ImageSource.camera, 'create'),
                    child: CustomContainerBoxShadow(
                        radius: 28,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 6.5.h,

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

                  SizedBox(
                    height: 6.5.h,
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextFiledShadowWidget(
                      width: 70.w,
                      hint: 'Travel_document_number'.tr,
                      suffix: false,
                      keyboardType: TextInputType.number,
                      controller:controller.passport_numController,
                    ),
                  )
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomButtonWidget(
                          width: 55.0.w,
                          height: 55,
                          loading: controller.dataRegisterLoading.value,
                          color: [
                            Colors.black12.withOpacity(.3) ,
                            Colors.black12.withOpacity(.7) ,
                          ],
                          borderRadius: 15,
                          onClick: () => Get.to(SecurityCodeScreen()),
                          title: "Skip".tr),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: CustomButtonWidget(
                          width: 55.0.w,
                          height: 55,
                          loading: controller.dataRegisterLoading.value,
                          color: [
                            Color(0xffB003CB),
                            Color(0xff60026F),
                          ],
                          borderRadius: 15,
                          onClick: () {
                            controller.dataRegister(context: context);
                          },
                          title: "Next".tr),
                    ),
                  ],
                ),
              ), 
            ],

          ),
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
