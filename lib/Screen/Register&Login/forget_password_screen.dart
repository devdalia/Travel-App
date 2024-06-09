 import 'package:amwaj_car/Screen/home_client/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/AppController.dart';
import '../../local_storage/shared_preferences/preferences.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/text_filed_button_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 18, right: 18,top: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
              Align(
                alignment: HiveController().languageCode == 'ar'?Alignment.centerRight:Alignment.centerLeft,
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back_ios)),
              ),
              CustomTextWidget(
                  title: 'Did_you_Forgot_your_password'.tr  ,
                  size:25,
                  fontWeight: FontWeight.w500),
              CustomTextWidget(
                  title: 'Search_for_my_account'.tr  ,
                  size:15,
                  color: Color(0xff0123FF),
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10.h),
              CustomTextWidget(
                  title: 'Enter_travel_document_number'.tr  ,
                  size:16,
                  fontWeight: FontWeight.w700),
              SizedBox(height: 1.5.h),
              TextFiledButtonWidget (hint: '', but:  "Search".tr ,
                  click: () {
                Get.to(HomeScreen());
                Get.put(AppController()).type.value='recovery';
              } )
            ],
          ),
        ),
      ),
    );
  }
}
