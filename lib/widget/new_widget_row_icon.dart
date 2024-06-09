import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/AppController.dart';
import 'custom_text_widget.dart';

// ignore: must_be_immutable
class NewWidgetRowIcon extends StatelessWidget {
  String title;
  String icon;

  Function()onTap;
  bool iconArrow;
  bool dark;
   NewWidgetRowIcon({
    Key? key,
     required this.title,
     required this.icon,
     required this.onTap,
     this.dark=false,
     this.iconArrow=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(icon,fit: BoxFit.contain,width: 22,color: Theme.of(context).iconTheme.color,),
          SizedBox(width: 3.w),
          CustomTextWidget(
              title:title  ,
              size:14 ),
          Spacer(),
          if(iconArrow==true)
            dark==false?Icon(Icons.arrow_forward_ios,size: 20,):
            SizedBox(
              width: 15.0.w,
              child:GetX<AppController>(
                init: AppController(),
                builder: (AppController controller)=> Switch(
                  value:controller.mode.value,
                  onChanged:controller.switchTheme,
                )
              ),
            ),
        ],

      ),
    );
  }
}