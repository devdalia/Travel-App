import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_text_widget.dart';


// ignore: must_be_immutable
class TimingsWidget extends StatelessWidget {
  String time;
  String title;
  String image;
  Color color;
  double ?width;
    TimingsWidget({Key? key,
      required this.title,
      required this.time,
      required this.image,
      required this.color,
        this.width,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        color:color,
        height: 6.5.h,
        child: Row(
          children: [
            Image.asset(image,
                fit: BoxFit.contain,width: width??18),
            SizedBox(width: 1.w),
            CustomTextWidget(
              title:title ,
              style: Theme.of(context).textTheme.bodyText2,),

            Spacer(),
            CustomTextWidget(
              title:time ,
              style: Theme.of(context).textTheme.bodyText2,),
          ],
        ));
  }
}
