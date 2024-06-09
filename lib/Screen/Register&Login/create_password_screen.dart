import 'package:amwaj_car/Screen/home_client/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/AppController.dart';
import '../../controllers/User_controller.dart';
import '../../helpers/binding.dart';
import '../../helpers/helper.dart';
import '../../local_storage/shared_preferences/preferences.dart';
import '../../utilities/const.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';
import '../../widget/text_filed_shadow_widget.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: Get.put(UserController()),
        builder: (controller) =>NewWidgetHeaderScreen(
      onClickLeading: () {
        AppController.to.login.value = 'no';
        AppController.to.changeIndex(1);
        Get.offAll(HomeScreen(), binding: Binding());
      },
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: HiveController().languageCode == 'en'?Alignment.centerRight:Alignment.centerLeft,
              child: CustomTextWidget(
                  title: 'step'.tr+'2',
                  size: 15,
                  textAlign: TextAlign.center,
                  color: kMainColor,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextWidget(
                title: 'Password'.tr,
                size: 25,
                fontWeight: FontWeight.w500),
            SizedBox(height: 5.h),

            TextFiledShadowWidget(
              password: true,
              hint: 'New_Password'.tr,
              controller: controller.passwordController,
            ),

            SizedBox(height: 10.h),
            CustomButtonWidget(
                width: 47.0.w,
                height: 55,
                color: [
                  Color(0xffB003CB),
                  Color(0xff60026F),
                ],
                loading: controller.passwordLoading.value,
                onClick: () {
                  if(controller.passwordController.text.length<6){
                    Helper.showSnackBar(context,
                        text:'The password must be at least 6 characters'.tr, error: true);

                  }else{
                    controller.password(context: context);
                  }

                },
                title: "Confirm".tr),
          ],
        ),
      ),
    ));
  }
}
