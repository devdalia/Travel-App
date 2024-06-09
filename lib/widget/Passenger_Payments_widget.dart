import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/controllers/Driver_controller.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Screen/home_client/home_screen.dart';

class PassengerPaymentsWidget extends StatelessWidget {
  const PassengerPaymentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (logic) {
        return Column(
          children: [
            ListView.builder(
              itemCount: logic.paymentsTravelersModel.data?.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var data = logic.paymentsTravelersModel.data?[index];
                int number = index + 1;
                return Container(
                  margin: EdgeInsets.only(top: 7, bottom: 7),
                  child: CustomContainerBoxShadow(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                    radius: 24,
                    border: false,
                    colorFill: data?.status == 'Pending'
                        ? Theme.of(context).colorScheme.background
                        : Color(0xffD9FFDC),
                    widgetContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 29,
                          width: 29,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              shape: BoxShape.circle),
                          child: CustomTextWidget(
                            title: number.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        SizedBox(width: 2.w),

                        SizedBox(
                          width: 30.w,
                          child: CustomTextWidget(
                            title: data?.status == 'Pending'?'passenger_seat'.tr+' '+number.toString():data?.client?.name ?? 'Name',
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        if(data?.status != 'Pending')
                        CustomTextWidget(
                          title: data?.client?.passportNum ?? 'passportNum',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(width: 10.w),
                        Icon(
                          Icons.check_circle_outline_sharp,
                          color: data?.status == 'Pending'
                              ? Theme.of(context).accentColor
                              : Color(0xff008F0B),
                          size: 30,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 5.h),
            InkWell(
              onTap: () {
                Get.to(HomeScreen());

                AppController.to.changeIndex(3);
              },
              child: Text(
                "Flight_in_progress".tr,
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),
              ),
            ),
          ],
        );
      },
    );
  }
}
