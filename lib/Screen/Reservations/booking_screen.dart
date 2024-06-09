import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/models/TypeReservationModel.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/alert_reservation_complete.dart';
import 'package:amwaj_car/widget/custom_container_topshadow_to_bottom_widget.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/individuals_widget.dart';
import 'package:amwaj_car/widget/loading_widget.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widget/display_booking_widget.dart';
import '../../widget/widget_container_button_custom.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  DataType? typeSeating;
  DataType? typeVIP;
  DataType? typeComfortable;

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: UserController(),
      builder: (UserController logic) {
        for (int i = 0; i < logic.typeReservationModel.data!.length; i++) {
          if (logic.typeReservationModel.data![i].type == 'VIP') {
            typeVIP = logic.typeReservationModel.data![i];
          } else if (logic.typeReservationModel.data![i].type ==
              'comfortable') {
            typeComfortable = logic.typeReservationModel.data![i];
          } else if (logic.typeReservationModel.data![i].type == 'seating') {
            typeSeating = logic.typeReservationModel.data![i];
          }
        }
        if (logic.typeReservationsLoading.value) {
          return LoadingWidget();
        }
        return NewWidgetHeaderScreen(
            onClickLeading: () {
              if (logic.typeBookingScreen.value == 'display') {
                Get.back();
              } else {
                logic.typeBookingScreen.value = 'display';
              }
            },
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      title: logic.allDataWalletUserModel?.data
                              ?.totalMyPointsOriginalWallet
                              .toString() ??
                          '',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(width: 3.w),
                    CustomTextWidget(
                      title: 'wallet_points'.tr,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              logic.typeBookingScreen.value = 'Seat';
                              logic.selectType.value =
                                  typeSeating!.id.toString();
                              if (logic.selectType.value.isNotEmpty)
                                logic.addTypeReservations(context: context);
                            },
                            child: Stack(children: [
                              CustomContainerTopShadowToBottom(
                                  height: HiveController().languageCode == 'en'
                                      ? 13.h
                                      : 12.h,
                                  title: 'Seat_Reservation'.tr,
                                  description: 'Seat_value'.tr +
                                      ' ' +
                                      typeSeating!.pointsCount.toString() +
                                      'Point'.tr,
                                  textColor: Colors.black,
                                  text: false,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  listColor: [
                                    Color(0xffFFAA00).withOpacity(.55),
                                    Color(0xffFFDD00).withOpacity(.55),
                                  ]),
                              if (logic.typeBookingScreen.value ==
                                      'Comfortable' ||
                                  logic.typeBookingScreen.value == 'VIP')
                                Container(
                                  width: double.infinity,
                                  height: HiveController().languageCode == 'en'
                                      ? 13.h
                                      : 12.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white38,
                                  ),
                                )
                            ]),
                          ),
                          SizedBox(height: 1.5.h),
                          InkWell(
                            onTap: () {
                              logic.typeBookingScreen.value = 'Comfortable';
                              logic.selectType.value =
                                  typeComfortable!.id.toString();
                              if (logic.selectType.value.isNotEmpty)
                                logic.addTypeReservations(context: context);
                            },
                            child: Stack(
                              children: [
                                CustomContainerTopShadowToBottom(
                                    height:
                                        HiveController().languageCode == 'en'
                                            ? 13.h
                                            : 12.h,
                                    title: 'Comfortable_booking'.tr,
                                    text: false,
                                    description: 'Seat_value'.tr +
                                        ' ' +
                                        typeComfortable!.pointsCount
                                            .toString() +
                                        'Point'.tr,
                                    textColor: Colors.white,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    listColor: [
                                      Color(0xff0082C0).withOpacity(.50),
                                      Color(0xff004160).withOpacity(.50),
                                    ]),
                                if (logic.typeBookingScreen.value == 'Seat' ||
                                    logic.typeBookingScreen.value == 'VIP')
                                  Container(
                                    width: double.infinity,
                                    height:
                                        HiveController().languageCode == 'en'
                                            ? 13.h
                                            : 12.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white38,
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          logic.typeBookingScreen.value = 'VIP';
                          logic.selectType.value = typeVIP!.id.toString();
                          if (logic.selectType.value.isNotEmpty)
                            logic.addTypeReservations(context: context);
                        },
                        child: Stack(
                          children: [
                            CustomContainerTopShadowToBottom(
                                height: HiveController().languageCode == 'en'
                                    ? 26.5.h
                                    : 25.h,
                                title: 'VIP_booking'.tr,
                                text: false,
                                description: 'Higher_quality_faster_access'.tr,
                                description2: 'Seat_value'.tr,
                                description3: typeVIP!.pointsCount.toString() +
                                    'Point'.tr,
                                textColor: Colors.white,
                                complete: true,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                listColor: [
                                  Color(0xffFF0000).withOpacity(.50),
                                  Color(0xff800000).withOpacity(.50),
                                ]),
                            if (logic.typeBookingScreen.value ==
                                    'Comfortable' ||
                                logic.typeBookingScreen.value == 'Seat')
                              Container(
                                width: double.infinity,
                                height: HiveController().languageCode == 'en'
                                    ? 26.5.h
                                    : 25.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white38,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                if (logic.typeBookingScreen.value == 'display')
                  DisplayBookingWidget(),

                if (logic.typeBookingScreen.value != 'display')
                  IndividualsWidget(),
                SizedBox(height: 2.h),
                if (logic.typeBookingScreen.value == 'VIP')
                  logic.getPointsCountTravelerLoading.value ||
                          logic.addTypeReservationsLoading.value
                      ? Container()
                      : NewWidgetContainerCustom(
                          text: 'customization'.tr,
                          colorText: kMainColor,
                          fillColor: false,
                          choose: true,
                          width: 40.w,
                          radius: 5,
                          onTap: ()=>logic.getTypeCar(context)),

                SizedBox(height: 5.h),

                  logic.getPointsCountTravelerLoading.value ||
                          logic.addTypeReservationsLoading.value
                      ? Container()
                      : Center(
                          child: Stack(
                            children: [
                              NewWidgetContainerCustom(
                                text: 'Book_now'.tr,
                                fillColor:logic.travel.value==null?false: true,
                                width: 60.w,
                                radius: 10,
                                colorText: Colors.white,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                onTap: () => reservationCompleted(context),
                              ),

                            ],
                          ),
                        ),
              ],
            ));
      },
    );
  }
}
