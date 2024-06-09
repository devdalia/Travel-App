import 'package:amwaj_car/Screen/home_client/delivery_nav/successfully_pay_screen.dart';
import 'package:amwaj_car/widget/custom_button_widget.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
        onClickLeading: () => Get.back(),
        widget: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: 'You_pay_for_the_market'.tr,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        CustomTextWidget(
                          title: 'SAMIR ROSHDY',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomContainerBoxShadow(
                          width: 78,
                          height: 83,
                          padding: EdgeInsets.all(12),
                          radius: 0,
                          widgetContainer: Image.asset(
                            'assets/images/user-market.png',
                            width: 30,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Image.asset(
                          'assets/images/double-Arrow.png',
                          width: 25,
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: .5.h),
                CustomContainerBoxShadow(
                  radius: 0,
                  padding:
                      EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 20),
                  widgetContainer: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'Seat_Ticket'.tr,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 1.5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              //// SizedBox(height: 1.h),
                              Image.asset(
                                'assets/images/line.png',
                                fit: BoxFit.fill,
                                height: 20,
                               color: Theme.of(context).cardTheme.color
                              ),
                              CustomContainerBoxShadow(
                                width: 35.w,
                                height: 3.5.h,
                                padding: EdgeInsets.zero,
                                radius: 0,
                                widgetContainer: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomTextWidget(
                                      title: 'YUSUF H ABUSOBUH',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    Container(
                                      width: 35.w,
                                      height: 4.h,
                                      color: Color(0xffEFEFEF).withOpacity(.35),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      //     SizedBox(width: 2.w),
                      Container(
                        width: 1.5,
                        height: 70,
                        color: Color(0xff707070),
                      ),
                      SizedBox(width: 3.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: '400',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          CustomTextWidget(
                            title: 'Point'.tr,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      title: '5',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Image.asset('assets/images/seat-car.png',
                        width: 9.w, height: 10.h,color: Theme.of(context).cardTheme.color,),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            contentPadding: EdgeInsets.fromLTRB(40, 5, 40, 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(
                                'Enter_the_security_code_to_confirm_the_operation'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            content:Container(
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
                                    /// backgroundColor: Colors.white,
                                    onSubmitted: (v) {
                                    ///  Get.to(HomeScreen());
                                    },
                                    onCompleted: (v) { }, onChanged: (String value) { },

                                  ),
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              Center(
                                child: CustomButtonWidget(
                                    width: 35.0.w,
                                    elevation: 10,
                                    height: 51,
                                    borderRadius: 10,
                                    color: [
                             Theme.of(context).cardColor ,
                             Theme.of(context).cardColor ,

                                    ],
                                    colorText: Theme.of(context).cardTheme.color!,
                                    onClick: ()=>Get.offAll(SuccessfullyPayScreen()),
                                    title: "Confirm".tr),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              )
                            ],
                          ),
                        );
                      },
                      child: CustomContainerBoxShadow(
                        padding: EdgeInsets.zero,
                        radius: 0,
                        height: 8.5.h,
                        width: 25.w,
                        colorFill: Color(0xffFF0000),
                        widgetContainer: Center(
                          child: CustomTextWidget(
                            title: 'Pay'.tr,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
