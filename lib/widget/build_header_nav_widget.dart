
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text_widget.dart';
// ignore: must_be_immutable
class BuildHeaderNavWidget extends StatelessWidget {
  Widget widget;
  String title;
  ScrollPhysics? scrollPhysics;
    BuildHeaderNavWidget({
    Key? key,
    required this.title,
    required this.widget,
      this.scrollPhysics
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: scrollPhysics,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 17.h,
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffF2BDFA),
                  Color(0xffEFE4EE),
                ],
              ),
            ),
            child:CustomTextWidget(
                title:title ,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                size:23 ),
          ),
          widget
        ],
      ),
    );
  }
}