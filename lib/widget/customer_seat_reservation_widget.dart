import 'package:amwaj_car/widget/custom_booking_type_row.dart';
import 'package:amwaj_car/widget/custom_button_widget.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_container_topshadow_to_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'custom_text_filed.dart';
import 'custom_text_widget.dart';

class CustomerSeatReservationWidget extends StatefulWidget {
  const CustomerSeatReservationWidget({Key? key}) : super(key: key);

  @override
  State<CustomerSeatReservationWidget> createState() =>
      _CustomerSeatReservationWidgetState();
}

class _CustomerSeatReservationWidgetState
    extends State<CustomerSeatReservationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomTextWidget(
            title: 'Customer_seat_reservation_screen'.tr,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(height: 3.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomContainerBoxShadow(
                padding: EdgeInsets.zero,
                radius: 5,
                height: 9.h,
                width: 30.w,
                widgetContainer: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 5.h,
                      child: Center(
                        child: CustomTextField(
                          hintText: 'Passport_No'.tr,
                          textAlign: TextAlign.center,
                          max: 1,
                          fillColor: Theme.of(context).backgroundColor,
                          textColor: Theme.of(context).accentColor,
                          borderRadius: 0,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffDDCA94),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          )),
                      child: CustomTextWidget(
                        title: 'Passenger_name_the_system'.tr,
                        color: Theme.of(context).cardTheme.color,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: CustomContainerBoxShadow(
                padding: EdgeInsets.zero,
                radius: 5,
                height: 9.h,
                width: 30.w,
                colorFill: Color(0xffDDCA94),
                widgetContainer: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      title: 'network'.tr,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Container(
                      height: 1,
                      width: 30.w,
                      color: Theme.of(context).primaryColor,
                    ),
                    CustomTextWidget(
                      title: '*****123',
                      size: 15,
                      color: Theme.of(context).cardTheme.color,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 2.w),
            CustomContainerTopShadowToBottom(
                height: 9.h,
                width: 20.w,
                title: 'bind'.tr,
                radius: 5,
                textColor: Colors.white,
                listColor: [
                  Color(0xff810A93),
                  Color(0xff7C86DC).withOpacity(.55),
                ]),
            SizedBox(width: 2.w),
          ],
        ),
        SizedBox(height: 3.h),
        Container(
          width: double.infinity,
          height: 1.3,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 3.h),
        CustomBookingTypeRowWidget(
            number: '505516',
            name: 'احمد حافظ صبح',
            permission: 'Permissible'.tr),
        SizedBox(height: 2.h),
        CustomBookingTypeRowWidget(
            number: '505521',
            name: 'محمد رامي بكري',
            permissionColor: Colors.red,
            permission: 'unacceptable'.tr),
        SizedBox(height: 2.h),
        CustomBookingTypeRowWidget(
            number: '505532',
            name: 'inactive'.tr,
            permissionColor: Colors.red,
            nameColor: Theme.of(context).accentColor,
            permission: 'unacceptable'.tr),
        SizedBox(height: 10.h),
        CustomButtonWidget(
            width: 40.0.w,
            height: 60,
            color: [
              Color(0xff920BA7),
              Color(0xffA20F0F),
            ],
            borderRadius: 5,
            onClick: () {
/*              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  contentPadding: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  insetPadding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),

                  title:   Text('A_code_has_been_sent_to_your_mobile'.tr+"\n+201227799163",
                      textAlign: TextAlign.center,
                      style:Theme.of(context).textTheme.headline3 ),
                  content: Container(
                    height: 14.h,
                   /// width: MediaQuery.of(context).size.width -50,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Please_enter_the_code_to_confirm_the_operation'.tr,
                          textAlign: TextAlign.center
                          ,style:Theme.of(context).textTheme.caption),
                        SizedBox(height: 1.h),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: SizedBox(
                            width: 50.w,
                            child: PinCodeTextField(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              appContext: context,
                              length: 4,
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
                                  borderRadius: BorderRadius.circular(1),
                                  fieldHeight: 5.7.h,
                                  fieldWidth: 10.0.w,
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  disabledColor: Colors.white,
                                  inactiveColor: Colors.white,
                                  selectedColor: Colors.white,
                                  activeColor: Colors.white),
                              animationDuration: const Duration(milliseconds: 300),
                              onChanged: (value) {},
                              onSubmitted: (v) {},
                              onCompleted: (v) {},

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    Center(
                      child: CustomButtonWidget(
                          width: 30.0.w,
                          height: 5.h,
                          color: [
                            Color(0xffFCEAFF),
                            Color(0xffFCEAFF),
                          ],
                          borderRadius: 1,
                          onClick: () {},
                          colorText: Theme.of(context).cardTheme.color!,
                          title: "Confirm".tr),
                    ),

                    SizedBox(height: 2.5.h,)

                  ],
                ),
              );*/
            },
            title: "Reservation_request".tr),
      ],
    );
  }
}
