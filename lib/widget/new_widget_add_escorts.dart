import 'package:amwaj_car/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';
import 'custom_text_widget.dart';

// ignore: must_be_immutable
class NewWidgetAddEscorts extends StatelessWidget {

  String title;bool left;
  TextEditingController? controller;
  NewWidgetAddEscorts({
    Key? key,
    required this.title,
    required this.left,
      this.controller,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height:5.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: left==true?Border(left:  BorderSide(color: Theme.of(context).accentColor)
                ):Border(right:  BorderSide(color: Theme.of(context).accentColor)
                )
            ),
            child: TextFormField(
                cursorColor: kMainColor,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  hoverColor: kMainColor,
                  focusColor: kMainColor,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).hintColor),
                showCursor: true,
                controller:controller ,
                keyboardType: TextInputType.number),),
          Container(
            height: 4.5.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              borderRadius: left==false?HiveController().languageCode == 'ar'?BorderRadius.only(
                  bottomLeft: Radius.circular(5)
              ):BorderRadius.only(
                  bottomRight: Radius.circular(5)
              ): HiveController().languageCode == 'ar'?BorderRadius.only(
                  bottomRight: Radius.circular(5)
              ):BorderRadius.only(
                  bottomLeft: Radius.circular(5)
              ),

            ),

            child:Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Theme.of(context).accentColor ,
                ),
                CustomTextWidget(
                    title: title,
                    style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
          )
        ],
      ),
    );
  }
}