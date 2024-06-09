
import 'package:amwaj_car/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'custom_text_widget.dart';
import 'package:sizer/sizer.dart';
// ignore: must_be_immutable
class NewWidgetContainerCustom extends StatelessWidget {
  String text;
  Function ()onTap;
  bool border;
  bool fillColor;
  bool choose;
  double radius;
  double ?width;
  Color colorText;
  AlignmentGeometry  begin;
  AlignmentGeometry  end;
  final bool? loading;
  NewWidgetContainerCustom({
    Key? key,
    required this.text,
    required this.onTap,
    required this.colorText,
    this.border=false,
    this.choose=false,
    this.fillColor=false,
    this.radius=8,
    this.width,
    this.loading,
    this.begin= Alignment.centerLeft,
    this.end= Alignment.centerRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        width:width?? 25.w,

        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 8,right: 8,bottom: 5,top: 8),
        decoration: BoxDecoration(
          color:Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(radius),
          border: border==true?Border.all(color:Theme.of(context).primaryColor ):Border(),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.2, 0.2),
                blurRadius: 5,
                color:  Theme.of(context).shadowColor),
          ],
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: fillColor==true?  [
              Color(0xff920BA7),
              Color(0xffA20F0F),
          ]:choose==true?[
              Theme.of(context).cardColor,
              Theme.of(context).cardColor
            ]:[
              Theme.of(context).cursorColor,
              Theme.of(context).cursorColor
            ],
          ),
        ),
        child:   loading != null && loading == true
            ? Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: kMainColor,
            size: 50,
          ),
        )
            :  CustomTextWidget(
            title: text ,
             size: 16,
             color: colorText ,
          fontWeight: FontWeight.w400,

      ),)
    );
  }
}