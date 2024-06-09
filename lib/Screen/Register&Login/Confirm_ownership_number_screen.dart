
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';

class ConfirmOwnershipNumberScreen extends StatefulWidget {

    ConfirmOwnershipNumberScreen({Key? key }) : super(key: key);

  @override
  State<ConfirmOwnershipNumberScreen> createState() =>
      _ConfirmOwnershipNumberScreenState();
}

class _ConfirmOwnershipNumberScreenState
    extends State<ConfirmOwnershipNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init:UserController(),
      builder: (UserController controller)=> NewWidgetHeaderScreen(
        onClickLeading: ()=> Get.back(),
        widget: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Align(
             alignment: HiveController().languageCode == 'en'?Alignment.centerRight:Alignment.centerLeft,
             child: CustomTextWidget(
                 title: 'step'.tr+'1',
                 size: 15,
                 textAlign: TextAlign.center,
                 color: kMainColor,
                 fontWeight: FontWeight.bold),
           ),
           CustomTextWidget(
               title: 'Confirm_the_ownership_of_the_number'.tr,
               size: 25,
               textAlign: TextAlign.center,
               fontWeight: FontWeight.bold),
           SizedBox(height: 6.h),
           CustomTextWidget(
               title: 'Activation_code_sent'.tr,
               size: 16,
               fontWeight: FontWeight.w400),
           CustomTextWidget(
               title: 'Please_enter_the_code_to_confirm_the_operation'.tr,
               size: 16,
               fontWeight: FontWeight.w400),
           SizedBox(height: 7.h),
           if(controller.textCode.value !='')
           CustomTextWidget(
               title:controller.textCode.value  ,
               size: 16,
               fontWeight: FontWeight.w400),

           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Expanded(
                 child:  Directionality(
                   textDirection: TextDirection.ltr,
                   child: PinCodeTextField(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     appContext: context,
                     length: 6,
                     keyboardType: TextInputType.number,
                     autoFocus: true,
                     obscureText: false,
                     textStyle: const TextStyle(color: Colors.black),
                     animationType: AnimationType.scale,
                     boxShadows: const [
                       BoxShadow(
                         offset: Offset(0, 1),
                         color: Colors.black12,
                         blurRadius: 10,
                       )
                     ],
                     enableActiveFill: true,
                     pinTheme: PinTheme(
                         shape: PinCodeFieldShape.box,
                         borderRadius: BorderRadius.circular(10),
                         fieldHeight: 7.7.h,
                         fieldWidth: 11.0.w,
                         activeFillColor: Colors.white,
                         inactiveFillColor: Colors.white,
                         selectedFillColor: Colors.white,
                         disabledColor: Colors.white,
                         inactiveColor: Colors.white,
                         selectedColor: Colors.white,
                         activeColor: Colors.white),
                     animationDuration: const Duration(milliseconds: 300),
                     /// backgroundColor: Colors.white,
                     onCompleted: (v) {
                       controller.code.value=v;
                       controller.confirmationCode(context: context);
                     },
                     onSubmitted: (v) {
                       controller.code.value=v;
                       print('dada');
                       controller.confirmationCode(context: context);
                     },
                     onChanged: (String value) {},
                       // Get.to(HomeScreen());
                       // HomeController.to.type.value='successfully' ;

                   ),
                 ),
               ),
               IconButton(onPressed: ()=>controller.phoneNo(context: context), icon: Icon(CupertinoIcons.refresh_bold,size: 30.0.sp,color: kPrimerColor,))
             ],
           ),
           SizedBox(height: 5.h),
         ],
       ),
   ),
      ),
    );
  }
}
