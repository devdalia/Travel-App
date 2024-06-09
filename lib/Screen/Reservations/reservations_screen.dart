import 'package:amwaj_car/Screen/home_client/home_screen.dart';
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/loading_widget.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:amwaj_car/widget/reservation_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: UserController(),
      builder: (logic) {
        print("object testing ${logic.profileModel.data?.passportNum}");
        if (logic.getReservationsClientLoading.value) {
          return LoadingWidget();
        }
        if (logic.getReservationClientModel!.data!.isEmpty) {
          return CustomTextWidget(
            title: logic.myReservationsModel.message.toString(),
            style: Theme.of(context).textTheme.headline1,
          );
        }
        return NewWidgetHeaderScreen(
            onClickLeading: () => Get.to(HomeScreen()),
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: 'Reservations'.tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 3.h),
                ...logic.getReservationClientModel!.data!
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ReservationWidget(
                            title: e.type == 'seating'
                                ? 'Seating_ticket'.tr
                                : e.type == 'comfortable'
                                    ? 'comfortable_ticket'.tr
                                    : 'VIP_ticket'.tr,
                            description: e.type == 'seating'
                                ? 'Reservation_by_representative'.tr
                                : e.type == 'comfortable'
                                    ? 'booked_by_yourself'.tr
                                    : 'Booked_by_passenger'.tr,
                            description1:
                                e.type == 'seating' || e.type == 'comfortable'
                                    ? 'I_have_booked_ticket_for_passport'.tr +
                                        e.client!.passportNum.toString()
                                    : e.client?.name ??
                                        "" + 'has_booked_a_ticket_for_you'.tr,
                            top: e.type != 'comfortable' ? true : false,
                            onTap: (){},
                            // onTap: () => logic.cancelConfirmReservation(context,
                            //     e.id ?? 0, int.parse(e.operationNum ?? "")),
                          ),
                        ))
                    .toList(),

                // SizedBox(height: 3.h),
                // ReservationWidget(
                //   title: 'comfortable_ticket'.tr,
                //   description: 'Booked_by_passenger'.tr,
                //   description1: 'Mahmoud_El_Maghribi_has_booked_ticket_for_you'.tr,
                //   top: false,
                // ),
                // SizedBox(height: 3.h),
                // ReservationWidget(
                //     title: 'VIP_ticket'.tr,
                //     description: 'Reservation_by_representative'.tr,
                //     description1:
                //     'I_have_booked_ticket_for_passport'.tr + '5055185'),
                // SizedBox(height: 3.h),
                // ReservationWidget(
                //     title: 'comfortable_ticket'.tr,
                //     description: 'Reservation_by_office'.tr,
                //     description1:
                //     'I_have_booked_ticket_for_passport'.tr + '5055185'),
              ],
            ));
      },
    );
  }
}
