import 'package:amwaj_car/Screen/Register&Login/successfully_create_account_widget.dart';
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/AppController.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_check_box_widget.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/widget_container_button_custom.dart';
import 'account_recovery_widget.dart';
import 'build_widget_login_register.dart';

class LoginAndRegisterScreen extends StatefulWidget {
  const LoginAndRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginAndRegisterScreen> createState() => _LoginAndRegisterScreenState();
}

class _LoginAndRegisterScreenState extends State<LoginAndRegisterScreen> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: Get.put(AppController()),
      builder: (AppController controller) {
        return controller.type == 'recovery'
            ? AccountRecoveryWidget()
            : controller.type == 'successfully'
                ? SuccessfullyCreateAccountWidget()
                : BuildWidgetLoginRegister(
                    title: controller.type == 'login'
                        ? 'Login'.tr
                        : "Create_account".tr,
                    description: controller.type == 'login'
                        ? 'Please_sign_in_to_your_account'.tr
                        : 'Please_sign_up_to_create_a_new_account'.tr,
                    child: [
                      if(controller.type == 'login')
                           CustomTextField(
                              hintText: 'ID_No'.tr,
                              max: 1,
                              typeIcon: 'Icon',
                              password: false,
                              fillColor: Colors.white.withOpacity(.20),
                              keyboardType: TextInputType.phone,
                              suffixIcon: "assets/images/user-border.png",
                        textEditingController:  UserController.to.personal_idController,
                            ),
                      SizedBox(height: 2.5.h),
                      controller.type == 'login'
                          ? CustomTextField(
                              hintText: 'Password'.tr,
                              typeIcon: 'Icon',
                              password: true,
                              fillColor: Colors.white.withOpacity(.20),
                              max: 1,
                              keyboardType: TextInputType.text,
                              suffixIcon: "assets/images/Icon-eye.png",
                        textEditingController:  UserController.to.passwordLoginController,
                            )
                          : CustomTextField(
                              hintText: 'Mobile_No'.tr,
                              keyboardType: TextInputType.phone,
                              line: true,
                              max: 1,
                              fillColor: Colors.white.withOpacity(.20),
                              typeIcon: 'Text',
                              textEditingController:  UserController.to.phone_noController,
                              suffixIcon: "assets/images/user-border.png",
                            ),
                      SizedBox(height: 3.5.h),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (controller.type != 'login')
                              CustomCheckBoxWidget(
                                value: check,
                                onChange: (v) {
                                  setState(() {
                                    check = v!;
                                    if(v==true){
                                      UserController.to.agreement.value=1;
                                    }else{
                                      UserController.to.agreement.value=0;
                                    }

                                  });
                                },
                                title:
                                    'I_have_read_and_agree_to_the_Terms_and_Conditions'
                                        .tr,
                              ),
                            SizedBox(height: 1.5.h),
                            if (controller.type != 'login')
                              CustomButtonWidget(
                                  color: [
                                    Color(0xffB003CB),
                                    Color(0xff60026F),
                                  ],
                                  width: 60.0.w,
                                  onClick: () {
                                      if ( UserController.to.agreement.value==0) {
                                    Helper.showSnackBar(context,
                                    text: 'Agree_to_special_terms_and_conditions'.tr, error: true);
                                    }   else if ( UserController.to.phone_noController.text.isEmpty) {
                                        Helper.showSnackBar(context,
                                            text: 'Mobile_number_Is_required'.tr, error: true);
                                      }
                                      else{
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(

                                                insetPadding: EdgeInsets.all(15),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(30)),
                                                title: Text(
                                                  'An_activation_code_will_be_sent_to_the_number'
                                                      .tr +
                                                      "\n +2 ${ UserController.to.phone_noController.text}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                                content: Container(
                                                  width: MediaQuery.of(context).size.width - 30,
                                                  child: Text(
                                                    'Do_you_want_to_continue'.tr,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                    children: [
                                                      GetBuilder< UserController>(
                                                          init: Get.put(UserController()),
                                                          builder: (controllerRegister) =>
                                                              NewWidgetContainerCustom(
                                                                text: 'Confirm'.tr,
                                                                choose: true,
                                                                loading: controllerRegister.phoneNoLoading.value,
                                                                colorText: Theme.of(context).cardTheme.color!,
                                                                onTap: () =>controllerRegister.phoneNo(context: context),
                                                              )),

                                                      NewWidgetContainerCustom(
                                                        text: 'Cancel'.tr,
                                                        choose: true,
                                                        colorText: Theme.of(context)
                                                            .cardTheme
                                                            .color!,
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2.5.h,
                                                  )
                                                ],
                                              ),
                                        );
                                      }

                                  },
                                  title: "Create_account".tr),
                            if (controller.type == 'login')
                              GetBuilder<UserController>(
                                init: Get.put(UserController()),
                                  builder: (controllerLogin) =>
                                      CustomButtonWidget(
                                          color: [
                                            Color(0xffB003CB),
                                            Color(0xff60026F),
                                          ],
                                          width: 60.0.w,
                                          height: 65,
                                          loading: controllerLogin.loginLoading.value,
                                          onClick: () {
                                            try {
                                              controllerLogin.login(context: context);
                                            } catch (e) {
                                              Get.snackbar('title', '$e');
                                            }
                                          },
                                          title: 'Login'.tr)),
                            SizedBox(height: 2.5.h),
                            if (controller.type == 'login')
                              InkWell(
                                onTap: () {
                                 controller.type.value='recovery';
                                },
                                child: CustomTextWidget(
                                    title: 'Did_you_Forgot_your_password'.tr,
                                    size: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            if (controller.type == 'login')
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: InkWell(
                                  onTap: () {
                                    UserController.to.initializationRegister();
                                    /// Get.to(LoginAndRegisterScreen());
                                  },
                                  child: Text("Create_New_Account".tr
                                    ,style: TextStyle(fontSize: 14,color: Colors.white, decoration: TextDecoration.underline),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
      },
    );
  }
  /*CustomTextField(
                              hintText: 'travel_document_photo'.tr,
                              keyboardType: TextInputType.phone,
                              line: true,
                              read: true,
                              fillColor: Colors.white.withOpacity(.20),
                              max: 1,
                              typeIcon: 'Icon',
                              suffixIcon: "assets/images/upload-cloud.png",
                            ),*/
}

/*           Row(
                    children: [
                      Expanded(
                        child: CustomButtonWidget(
                            color:  [
                              Color(0xffB003CB),
                              Color(0xff60026F),
                            ],
                            width: 60.0.w,
                            height: 65,
                            onClick: () {
                                Get.put(HomeController()).login.value='yse';
                                Get.put(HomeController()).home.value='client';
                                Get.put(HomeController()).map.value='client';
                              Get.put(HomeController()).changeIndex(4);

                            },
                            title:  '\tClient'),
                      ),  SizedBox(width: 2.w),
                      Expanded(
                        child: CustomButtonWidget(
                            color:  [
                              Color(0xffB003CB),
                              Color(0xff60026F),
                            ],
                            width: 60.0.w,
                            height: 65,
                            onClick: () {
                                Get.put(HomeController()).login.value='yse';
                                Get.put(HomeController()).trip.value='driver';
                                Get.put(HomeController()).map.value='driver';
                              Get.put(HomeController()).changeIndex(3);
                            },
                            title:  '\tDriver'),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: CustomButtonWidget(
                            color:  [
                              Color(0xffB003CB),
                              Color(0xff60026F),
                            ],
                            width: 60.0.w,
                            height: 65,
                            onClick: () {
                                Get.put(HomeController()).login.value='yse';
                                Get.put(HomeController()).home.value='Representative';
                              Get.put(HomeController()).changeIndex(4);

                            },
                            title:  'Representative'),
                      ),
                    ],
                  ),*/
