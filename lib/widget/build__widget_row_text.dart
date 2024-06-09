import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_text_widget.dart';

// ignore: must_be_immutable
class NewWidgetRowText extends StatelessWidget {
  String? text1, text2, text3, text4;
Color ?color;
  NewWidgetRowText({
    Key? key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomTextWidget(
              title: text1,
              size: 13,
              color:color?? Color(0xff929292),
            ),
          ),

          buildExpanded(text2!),
          SizedBox(width: 1.5.w),
          buildExpanded(text3!),
          buildExpanded(text4!),
        ],
      ),
    );
  }

  Expanded buildExpanded(String text) {
    return Expanded(

        child: CustomTextWidget(
          title: text,
        size: 13,
        textAlign: TextAlign.center,
        color: color??Color(0xff929292),
        //  style: Theme.of(context).textTheme.bodyText2,
        ),
      );
  }
}
