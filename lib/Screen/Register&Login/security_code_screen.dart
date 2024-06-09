

import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../local_storage/shared_preferences/preferences.dart';
import '../../utilities/const.dart';
import '../../widget/custom_text_widget.dart';

class SecurityCodeScreen extends StatefulWidget {
  const SecurityCodeScreen({Key? key}) : super(key: key);

  @override
  State<SecurityCodeScreen> createState() => _SecurityCodeScreenState();
}

class _SecurityCodeScreenState extends State<SecurityCodeScreen> {
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
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 0),
          child:    ListView(
            children: [
              Align(
                alignment: HiveController().languageCode == 'en'?Alignment.centerRight:Alignment.centerLeft,
                child: CustomTextWidget(
                    title: 'step'.tr+'4',
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
              SizedBox(height: 2.h),

              CustomTextWidget(
                  title: 'Add_Security_Code'.tr,
                  size: 18,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold),
              CustomTextWidget(
                  title: 'Helps_you_confirm_sensitive_operations'.tr,
                  size: 14,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w300),

              SizedBox(height: 5.h),
              Container(
                height:8.h,
                width: MediaQuery.of(context).size.width-15,
                padding: EdgeInsets.only(top: 20,bottom: 20),
                margin: EdgeInsets.only(left: 5,right: 5),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    //     width: 10.w,
                    child: PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.number,
                      autoFocus: true,
                      obscureText: true,
                      textStyle:   TextStyle(color: Theme.of(context).iconTheme.color,fontSize:7.5,),
                      animationType: AnimationType.scale,
                      enableActiveFill: true,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight:16,
                          fieldWidth: 16,
                          activeFillColor:Theme.of(context).indicatorColor,
                          inactiveFillColor:Theme.of(context).indicatorColor,
                          selectedFillColor: Theme.of(context).indicatorColor,
                          disabledColor: Theme.of(context).indicatorColor,
                          inactiveColor:Theme.of(context).indicatorColor,
                          selectedColor: Theme.of(context).indicatorColor,
                          activeColor:Theme.of(context).indicatorColor),
                      animationDuration: const Duration(milliseconds: 300),
                      onCompleted: (v) {
                        controller.security_code.value=v;
                        controller.securityCode(context: context);
                      },
                      onSubmitted: (v) {
                        controller.security_code.value=v;
                        print('dada');
                        controller.securityCode(context: context);
                      },
                      onChanged: (String value) {  },


                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.center,
                child: CustomButtonWidget(
                    width: 55.0.w,
                    height: 55,
                    loading: controller.dataRegisterLoading.value,
                    color: [
                      Color(0xffB003CB),
                      Color(0xff60026F),
                    ],
                    borderRadius: 15,
                    onClick: () => controller.securityCode(context: context),
                    title: "Create_account".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
