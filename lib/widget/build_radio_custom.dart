import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text_widget.dart';

// ignore: must_be_immutable
class BuildRadioCustom extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  Widget widget;

    BuildRadioCustom({Key? key,
      required this.widget,
      required this.title,
      required this.subTitle,
      required this.image,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget,
        Image.asset(image,fit: BoxFit.contain,width: 35,),
        SizedBox(width :2.w),
        CustomTextWidget(
            title: subTitle,
            size: 8,
            fontWeight: FontWeight.w400),
        SizedBox(width :3.5.w),

        CustomTextWidget(
            title:
           title,
            size: 16,
            fontWeight: FontWeight.w700),

      ],
    ) ;
  }
}
