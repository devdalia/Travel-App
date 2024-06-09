import 'package:amwaj_car/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';
import 'custom_text_widget.dart';

// ignore: must_be_immutable
class CustomContainerTopShadowToBottom extends StatefulWidget {

  String title;
  String ?description;
  String ?description2;
  String ?description3;
  List<Color> listColor;
  Color  textColor;
  Function()?onTap;
  AlignmentGeometry  begin;
  AlignmentGeometry  end;
  double height;
  double? width;
  double ?radius;
  bool text;
  bool complete;
   CustomContainerTopShadowToBottom({Key? key, required this.title , required this.height ,
     this.text=true,
     this.complete=false,
     this.begin= Alignment.topCenter,
     this.end= Alignment.bottomCenter,
     this.description,
     this.description2,
     this.width,
     this.description3,
     this.radius=10,
     this.textColor=Colors.black ,required this.listColor,this.onTap}) : super(key: key);

  @override
  State<CustomContainerTopShadowToBottom> createState() => _CustomContainerTopShadowToBottomState();
}

class _CustomContainerTopShadowToBottomState extends State<CustomContainerTopShadowToBottom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
       child: Container(
    width:widget.width ,
        height:widget.height,
        padding: EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius!),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.2, 0.2),
                blurRadius: 5,
                color:  kColorText),
          ],
          gradient: LinearGradient(
              begin: widget.begin,
              end: widget.end,
              colors: widget.listColor,
       ///   stops:[0.0005,1.0]
          ),
        ),
        child: Center(
          child:widget.text==true? CustomTextWidget(
            title: widget.title,
            color: widget.textColor,
            size: 18,
            fontWeight: FontWeight.w600,
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                title: widget.title,
                color: widget.textColor,
                size: 18,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: .5.h),
              CustomTextWidget(
                title: widget.description,
                color: widget.textColor,
                size: HiveController().languageCode == 'en' ?13:12,
                textAlign: TextAlign.center ,
                fontWeight:HiveController().languageCode == 'en' ?FontWeight.w700: FontWeight.w500,
              ),
              if(widget.complete==true)

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:  EdgeInsets.only(top: 15,bottom: 15),
                      color: Colors.white.withOpacity(.52),
                      width: double.infinity,
                      height: HiveController().languageCode == 'en' ?1.5:1,
                    ),
                    CustomTextWidget(
                      title: widget.description2,
                      color: widget.textColor,
                      size: 13,
                      fontWeight:HiveController().languageCode == 'en' ?FontWeight.w700: FontWeight.w500,
                    ),
                    CustomTextWidget(
                      title: widget.description3,
                      color: widget.textColor,
                      size: 13,
                      fontWeight:HiveController().languageCode == 'en' ?FontWeight.w700: FontWeight.w500,
                    ),
                  ],
                ),
            ],
          ),
        ), ),
    );
  }
}
