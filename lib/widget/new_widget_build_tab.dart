

import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// ignore: must_be_immutable
class NewWidgetBuildTab extends StatelessWidget {
  String title; bool choose;
  Function() click;
  Color color;
  double width;
    NewWidgetBuildTab({
    Key? key,
    required this.title,
    required this.width,
      this.choose=false,
      this.color=Colors.red,
    required this.click,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextWidget(
            title: title,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height:choose == true?1.h: 1.5.h),
          if (choose == true)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 1.5,
                width: width,
                color:color,
              ),
            )
        ],
      ),
    );
  }
}