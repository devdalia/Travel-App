import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utilities/const.dart';
import 'custom_container_box_shadow.dart';
import 'custom_text_widget.dart';

// ignore: must_be_immutable
class ReservationWidget extends StatelessWidget {
  String title, description, description1;
  bool top;
  Function()? onTap;

  ReservationWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.description1,
    required this.onTap,
    this.top = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 8.h,
            width: 35.w,
            padding: EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.2, 0.2),
                    blurRadius: 3,
                    color: kColorText),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kColorText.withOpacity(.50),
                    Colors.white.withOpacity(.18),
                  ]),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    top == true
                        ? 'assets/images/arrow_one_top.png'
                        : 'assets/images/arrow_one_down.png',
                    fit: BoxFit.contain,
                    width: 18,
                  ),
                  SizedBox(width: 1.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          title: title,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        CustomTextWidget(
                          title: description,
                          size: 10,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(

            child: CustomContainerBoxShadow(
              radius: 0,
              height: 8.h,
              padding: EdgeInsets.only(left: 5,right: 5),
              widgetContainer: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomTextWidget(
                      title: description1,
                      size: 12,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                 SizedBox(width: 1.w),

                  InkWell(
                    onTap: onTap,
                    child: CustomTextWidget(
                      title: 'Cancel'.tr,
                      size: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
