import 'package:amwaj_car/Screen/home_client/delivery_nav/scan_barcode%20_pay_screen.dart';
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/widget/build_Record_bookings_and_payments_widget.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_container_topshadow_to_bottom_widget.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../Reservations/booking_screen.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (logic){
        var dataPayment=logic.allDataWalletUserModel?.data;
        return NewWidgetHeaderScreen(
          onClickLeading: () => Get.back(),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomTextWidget(
                  title: 'We_will_deliver_and_comfort_you'.tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(height: 5.h),
              CustomContainerBoxShadow(
                radius: 30,
                padding: EdgeInsets.all(15),
                widgetContainer: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomContainerTopShadowToBottom(
                              onTap: ()=>Get.to(BookingScreen()),
                              title: 'booking'.tr,
                              height:  7.h,
                              textColor: Colors.white,
                              listColor: [
                                Color(0xff000000),
                                Color(0xff8C8C8C),
                              ]),
                          SizedBox(height: 1.5.h),
                          CustomContainerTopShadowToBottom(
                              onTap: ()=>Get.to(ScanBarcodePayScreen()),
                              height:  7.h,
                              title: 'Pay'.tr,
                              textColor: Colors.white,
                              listColor: [
                                Color(0xff0582BE),
                                Color(0xff8C8C8C),
                              ]),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),
                    rowWidget(
                        'wallet_points'.tr, 'Reserved_Points'.tr, 'Paid_points'.tr),
                    SizedBox(width: 5.w),
                    rowWidget( dataPayment?.totalMyPointsOriginalWallet.toString() ?? '',
                        dataPayment?.countReservedPoints.toString() ?? '', dataPayment?.myPayments.toString() ?? ''),
                  ],
                ),
              ),
              SizedBox(height: 5.5.h),
              CustomTextWidget(
                title: 'Record_bookings_and_payments'.tr,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 2.5.h),
              ListView.builder(
                  itemCount: logic.allPaymentsRecordModel.data?.allPaymentsRecord?.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    var data=logic.allPaymentsRecordModel.data?.allPaymentsRecord?[index];

                    DateTime parseDate = new DateFormat("yyyy-MM-dd").parse( data?.createdAt.toString()??"");
                    var inputDate = DateTime.parse(parseDate.toString());
                     var outputFormat = DateFormat("yyyy-MM-dd");
                     var outputDate = outputFormat.format(inputDate);
                  print(outputDate);
                return   buildRecordBookingsPaymentsWidget(
                    date:outputDate, id: data?.operationNum.toString()??"",
                    value:data?.paid=='1'? 'has_been_discount'.tr+'\n'+ "${data!.pointsCount.toString()} "+ 'Point'.tr:"Not_paid".tr,
                    description: 'descr');
              }),

              //
              // SizedBox(height: 1.0.h),
              // buildCustomContainerBoxShadow('11278', 'Return_ticket_from_the_crossing'.tr),
              // SizedBox(height: 1.0.h),
              // buildCustomContainerBoxShadow('11278', 'One_way_ticket_from_the_crossing'.tr),
              // SizedBox(height: 1.0.h),
              // buildCustomContainerBoxShadow('11278', 'Return_ticket_from_the_crossing'.tr),
              // SizedBox(height: 1.0.h),
              // buildCustomContainerBoxShadow('11278', 'One_way_ticket_from_the_crossing'.tr),
            ],
          ),
        );
      },

    );
  }


  Widget rowWidget(String string1, String string2, String string3) {
    return Expanded(
      child: Column(
        children: [
          CustomTextWidget(
            title: string1,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 1.5.h),
          CustomTextWidget(
            title: string2,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 1.5.h),
          CustomTextWidget(
            title: string3,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}

