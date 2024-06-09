import 'package:amwaj_car/Screen/Reservations/reservations_screen.dart';
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/helpers/binding.dart';
import 'package:amwaj_car/widget/widget_container_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';

Future reservationCompleted(BuildContext context) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(40, 5, 40, 5),
      insetPadding: EdgeInsets.all(15),
      backgroundColor: Theme.of(context).dividerColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        children: [
          Align(
            alignment: HiveController().languageCode == 'ar'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.clear,
                  color: Theme.of(context).cardTheme.color, size: 25),
              onPressed: () => Get.back(),
            ),
          ),
          Center(
              child: Image.asset(
            'assets/images/like.png',
            width: 100,
          )),
        ],
      ),
      content: Container(
        width: MediaQuery.of(context).size.width - 20,
        margin: EdgeInsets.only(top: 25, bottom: 15),
        child: Text(
          'Your_reservation_has_been_completed'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).iconTheme.color),
        ),
      ),
      actions: <Widget>[
        Center(
          child: NewWidgetContainerCustom(
            text: 'Go_to_reservations'.tr,
            fillColor: true,
            width: 60.w,
            radius: 10,
            colorText: Colors.white,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            onTap: () {
              Get.off(ReservationsScreen(),binding: Binding());
              UserController.to.typeBookingScreen.value = 'display';
            },
          ),
        ),
        SizedBox(
          height: 2.5.h,
        )
      ],
    ),
  );
}
