
import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final bool value;
  final String? title;
  final Widget? titleWidget;
  final ValueChanged<bool?>? onChange;
  final Color  textColor;

  const CustomCheckBoxWidget({required this.value,required this.onChange,this.title,this.textColor= Colors.white,this.titleWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: 50,
          color: Colors.transparent,

          child: Container(
            width: 24.0,
            height: 24.0,

            child: Checkbox(
              value: value,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              activeColor: Color(0xffB703D3),

              side: const BorderSide(width: 1.2, color: Color(0xffB703D3)),
              onChanged: onChange,
            ),
          ),
        ),
        SizedBox(width: 5),
        titleWidget == null ? CustomTextWidget(
          title: title,
          fontWeight: FontWeight.w400,
          color:  textColor ,
          size: 13,
        ) : titleWidget!
      ],
    );
  }
}