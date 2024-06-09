import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'custom_container_box_shadow.dart';
import 'custom_text_widget.dart';
// ignore: must_be_immutable
class CustomBookingTypeRowWidget extends StatelessWidget {
  String number,name,permission;
  Color? nameColor;
  Color ?permissionColor;
    CustomBookingTypeRowWidget({Key? key,
      required this.number,
      required this.name,
      required this.permission,
        this.nameColor,
        this.permissionColor,


    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  title: number ,
                  style: Theme.of(context).textTheme.caption,
                ),
                Container(
                  height: 1,
                  width: 30.w,
                  color: Theme.of(context).primaryColor,
                ),CustomTextWidget(
                  title: name,
                  size: 15,
                  color: nameColor??Theme.of(context).cardTheme.color,
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
            widgetContainer: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextWidget(
                  title: 'Booking_type'.tr ,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Icon( Icons.keyboard_arrow_down,size: 30)
              ],
            ),
          ),
        ),
        SizedBox(width: 4.w),
        SizedBox(
          width: 20.w,
          child: CustomTextWidget(
            title: permission,
            size: 15,
            textAlign: TextAlign.center,
            color: permissionColor??Color(0xff21BF2D),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 2.w),
      ],
    );
  }
}
