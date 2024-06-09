import 'dart:async';

import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/Customer_accounts_charging_widget.dart';
import 'package:amwaj_car/widget/custom_container_topshadow_to_bottom_widget.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/customer_seat_reservation_widget.dart';
import 'package:amwaj_car/widget/detailed_transaction_history_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class HomeRepresentativeNavScreen extends StatefulWidget {
  const HomeRepresentativeNavScreen({Key? key}) : super(key: key);

  @override
  State<HomeRepresentativeNavScreen> createState() => _HomeRepresentativeNavScreenState();
}

class _HomeRepresentativeNavScreenState extends State<HomeRepresentativeNavScreen>
    with TickerProviderStateMixin {
  DateTime now = DateTime.now();
  String? time;
  String? animation;
  late AnimationController _controller;
  Timer? _timer;
  DateTime? _dateTime;

  @override
  void initState() {
    _getDateTime();

    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _getDateTime());

    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        animation = '';
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  _getDateTime() {
    setState(() {
      _dateTime = DateTime.now();
      time = DateFormat(' hh : mm : ss').format(_dateTime!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init:AppController(),
      builder: (AppController controller) {
        return SingleChildScrollView(
          padding:
              controller.homeClient.value == 'Customer_Accounts_Charging_Screen'
                  ? EdgeInsets.only(bottom: 10, top: 0)
                  : EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 30),
          child: Column(
            children: [

              if (controller.homeClient.value!=
                  'Customer_Accounts_Charging_Screen')
              Padding(
                padding: controller.homeClient.value ==
                        'Customer_Accounts_Charging_Screen'
                    ? EdgeInsets.only(left: 15, right: 15)
                    : EdgeInsets.zero,
                child: Column(
                  children: [
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Container(
                            width: 43,
                            height: 43,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.2, 0.2),
                                    blurRadius: 7,
                                    color: Theme.of(context).shadowColor),
                              ],
                              color: Theme.of(context).cardColor,
                            )),
                        CustomTextWidget(
                          title: 'Noor Ali',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Spacer(),
                        CustomTextWidget(
                          title: '20000',
                          color: Color(0xffDABF03),
                          size: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context).iconTheme.color!,
                                  width: .5)),
                          child: CustomTextWidget(
                            title: '\$',
                            color: Color(0xffDABF03),
                            size: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              if (controller.homeClient.value == 'home')
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomContainerTopShadowToBottom(
                              height: 13.h,
                              onTap:()=>controller.homeClient.value = 'Customer_Accounts_Charging_Screen',
                              title: 'Recharge_points'.tr,
                              textColor: Colors.white,
                              listColor: [
                                Color(0xff810A93),
                                Color(0xff7C86DC).withOpacity(.55),
                              ]),
                          SizedBox(height: 1.5.h),
                          CustomContainerTopShadowToBottom(
                              onTap:()=>controller.homeClient.value = 'Customer_seat_reservation_screen',
                              height: 13.h,
                              title: 'booking_tickets'.tr,
                              textColor: Colors.white,
                              listColor: [
                                Color(0xff920BA7),
                                Color(0xffA20F0F),
                              ])
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 27.h,
                          padding: EdgeInsets.only(
                              left: 15, right: 15, bottom: 10, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.2, 0.2),
                                    blurRadius: 5,
                                    color: kColorText),
                              ],
                              color: Color(0xff0A113F).withOpacity(.70)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                title: 'The_time_is_now'.tr,
                                color: Color(0xffF7FF00),
                                size: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomTextWidget(
                                title: time,
                                color: Color(0xffF7FF00),
                                size: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  CustomTextWidget(
                                    title: 'Rafah_border_crossing'.tr,
                                    color: Color(0xffF7FF00),
                                    size: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 2.w),
                                  Container(
                                    height: 4.h,
                                    width: 1.2,
                                    color: Color(0xffF7FF00),
                                  ),
                                  SizedBox(width: 2.w),
                                  Icon(CupertinoIcons.triangle_fill,
                                      color: Color(0xff21BF2D), size: 15),
                                  SizedBox(width: 1.w),
                                  CustomTextWidget(
                                    title: 'Open'.tr,
                                    color: Color(0xffF7FF00),
                                    size: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if (controller.homeClient.value == 'Detailed_transaction_history')
                DetailedTransactionHistoryWidget(),
              if (controller.homeClient.value ==
                  'Customer_Accounts_Charging_Screen')
                CustomerAccountsChargingWidget(),
              if (controller.homeClient.value ==
                  'Customer_seat_reservation_screen')
                CustomerSeatReservationWidget(),
            ],
          ),
        );
      },
    );
  }
}
