

import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewWidgetCheckBox extends StatelessWidget {

  String title ;Widget widget;Function ()click;
  NewWidgetCheckBox({
    required this.title,
    required this.click,
    required this.widget,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            elevation: 50,
            color: Colors.transparent,
            child: Container(
              width: 20.0,
              height: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: kMainColor)
              ),
              child:widget,
            ),
          ),
          SizedBox(width: 5),
          CustomTextWidget(
            title: title,
            fontWeight: FontWeight.w400,
            color:  Theme.of(context).cardTheme.color! ,
            size: 13,
          )
        ],
      ),
    );
  }
}