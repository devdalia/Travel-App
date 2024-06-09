import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// ignore: must_be_immutable
class buildRecordBookingsPaymentsWidget extends StatelessWidget {
  String date;
  String id;
  String value;
  String description;
    buildRecordBookingsPaymentsWidget({
    Key? key,
    required this.date,
    required this.id,
    required this.value,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7,bottom: 7),
      child: CustomContainerBoxShadow(
        padding: EdgeInsets.all(5),
        radius: 0,
        widgetContainer: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 1.5.w),
            CustomTextWidget(
              title: date,
              textAlign: TextAlign.center,
              size: 14,
              color: Theme.of(context).colorScheme.secondary,),

            Container(
              width: 1,
              height: 21,
              margin: EdgeInsets.only(left: 10,right: 10),
              color: Theme.of(context).colorScheme.secondary,
            ),

            CustomTextWidget(
              title: id,
              textAlign: TextAlign.center,
              size: 14,
              color: Theme.of(context).colorScheme.secondary,),
            SizedBox(width: 7.w),
            Expanded(
              child: CustomTextWidget(
                title: value,
                textAlign: TextAlign.center ,
                size: 14,
                color: Theme.of(context).colorScheme.secondary,),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: CustomTextWidget(
                title:description,
                textAlign: TextAlign.center,
                size: 14,
                color: Theme.of(context).colorScheme.secondary,),
            ),
            SizedBox(width: 1.5.w),
          ],
        ),
      ),
    );
  }
}