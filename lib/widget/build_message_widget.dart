import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../utilities/const.dart';
import 'custom_button_widget.dart';

class BuildMessageWidget extends StatelessWidget {
  final String title;
  final String? des;
  final Color? color;
  final bool error;
  final Function()? onClick;

  BuildMessageWidget(
      {required this.title, this.color, required this.error, this.onClick,this.des});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xff707070),width: 2)
        ),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.clear),
                ),
              ),
              Transform.scale(
                scale: error ? 1.6 : 1.2,
                child: Container(
                  height: 15.h,
                  child: Lottie.asset(
                    error
                        ? 'assets/images/error_cancelled.json'
                        : 'assets/images/check_success.json',
                    repeat: false,
                  ),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color ?? Color(0xff707070), fontSize: 14),
              ),
              if(des != null) Container(
                child: Text(
                  des ?? '',
                  textAlign: Get.locale?.languageCode == 'ar' ? TextAlign.start : TextAlign.end,
                  style: TextStyle(
                    height: 1.3,
                      color: color ?? Color(0xff707070), fontSize: 13),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (onClick != null)
                CustomButtonWidget(
                  color: [kMainColor,kMainColor],
                  title: 'ok'.tr,
                  padding: 10,
                  onClick: onClick!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
