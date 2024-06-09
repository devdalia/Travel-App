import 'package:amwaj_car/controllers/Driver_controller.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/check_box.dart';
import 'package:amwaj_car/widget/custom_button_widget.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/showDialog.dart';
import 'package:amwaj_car/widget/text_filed_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ConfirmReservationsWidget extends StatelessWidget {
  const ConfirmReservationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    GetBuilder<DriverController>( 
      init: DriverController(),
      builder: (logic){
        return Column(
          children: [

            if ( logic.openJourney.value == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFiledButtonWidget(
                        hint: 'Enter_the_passport_number_of_the_traveler'.tr,
                        but: "Create_trip".tr,
                        textEditingController:
                        logic.passport_numJourneyController,
                        loading: logic.createJourneyLoading.value,
                        click: () => logic.createJourney(context: context)),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NewWidgetCheckBox(
                        title: 'A_one_way_ticket'.tr,
                        click: () => logic.changeJourneyType(0),
                        widget: logic.travelJourney.value == 0
                            ? Icon(
                          Icons.check,
                          color: kMainColor,
                          size: 12.sp,
                        )
                            : Container(),
                      ),
                      SizedBox(width: 5.w),
                      NewWidgetCheckBox(
                        title: 'Return_ticket'.tr,
                        click: () => logic.changeJourneyType(1),
                        widget: logic.travelJourney.value == 1
                            ? Icon(
                          Icons.check,
                          color: kMainColor,
                          size: 12.sp,
                        )
                            : Container(),
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(height: 3.h),
            if (logic.index.value == 0&&logic.openJourney.value == true)
              CustomButtonWidget(
                  width: 35.0.w,
                  height: 55,
                  borderRadius: 15,
                  color: [
                    kPrimerColor,
                    kPrimerColor,
                  ],
                  loading: logic.openJourneyLoading.value,
                  onClick: () =>openTripDialog(context: context),
                  title: "open_trip".tr),
              SizedBox(height: 3.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                NewWidgetCheckBox(
                  title: 'A_one_way_ticket'.tr,
                  click: ()=>logic.changeBookingType(0),
                  widget: logic.travel.value == 0
                      ? Icon(
                    Icons.check,
                    color: kMainColor,
                    size: 12.sp,
                  )
                      : Container(),
                ),
                SizedBox(width: 5.w),
                NewWidgetCheckBox(
                  title: 'Return_ticket'.tr,
                  click: ()=>logic.changeBookingType(1),
                  widget: logic.travel.value == 1
                      ? Icon(
                    Icons.check,
                    color: kMainColor,
                    size: 12.sp,
                  )
                      : Container(),
                ),
              ],
            ),
            SizedBox(height: 2.5.h),
            TextFiledButtonWidget (hint: 'Enter_the_passport_number_of_the_traveler'.tr,
                but:  "Reservation_and_confirm".tr ,
                textEditingController: logic.passport_numController,
                loading: logic.addPassportNumLoading.value,
                click: ()=>logic.addPassportNumIntoReadyTraveling(context: context)),

            SizedBox(height: 3.h),
            Container(
              height: 1,
              width: double.infinity,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(height: 3.h),
            if( logic.getAllConfirmedReservationsModel.data!.allTravelersConfirmedWithDriverWait!.dataReservations!.isNotEmpty)
              ListView.builder(
                itemCount: logic.getAllConfirmedReservationsModel.data?.allTravelersConfirmedWithDriverWait?.dataReservations?.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  var data=logic.getAllConfirmedReservationsModel.data?.allTravelersConfirmedWithDriverWait?.dataReservations?[index];
                  return  Container(
                    margin: EdgeInsets.only(top:7,bottom: 7),
                    child: CustomContainerBoxShadow(
                      padding: EdgeInsets.only(left:10,right: 10,top: 5,bottom: 5),
                      radius: 24,
                      border: false,
                      colorFill: Color(0xff81BCD9).withOpacity(.20),
                      widgetContainer: Row(
                        children: [
                          Container(
                            height: 9,
                            width:9,
                            decoration: BoxDecoration(
                                color:kPrimerColor,
                                shape: BoxShape.circle
                            ),

                          ),
                          SizedBox(width: 2.w),
                          CustomTextWidget(
                            title: data?.client?.passportNum??'',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Container(
                            width:1.3 ,
                            margin: EdgeInsets.only(left: 7,right: 7),
                            height: 4.h,
                            color: Theme.of(context).primaryColor,
                          ),
                          CustomTextWidget(
                            title: data?.client?.name??'',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: ()=>logic.cancelConfirmReservation(context,data?.id??0,int.parse(data?.jurneyNum??'')),
                            child: CustomTextWidget(
                              title: 'Cancel'.tr,
                              color: Colors.red,
                              size: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },

              ),
            SizedBox(height: 3.h),

           Stack(
          children: [
            CustomButtonWidget(
                width: 35.0.w,
                height: 55,
                borderRadius: 15,
                color: [
                  Colors.green,
                  Colors.lightGreen,
                ],
                loading: logic.openJourneyLoading.value,
                onClick: () {

                logic.  StartJourney(context);
                  print("object 1000");
                },
                title: "start_journey".tr),
            if( logic.getAllConfirmedReservationsModel.data!.loading!=1)
            Container(
              width: 35.0.w,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white54,
              ),

            )
          ],
        )
          ],
        );
      },

    );
  }
}
