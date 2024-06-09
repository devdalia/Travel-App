import 'package:amwaj_car/widget/build__widget_row_text.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'custom_text_widget.dart';

class DetailedTransactionHistoryWidget extends StatefulWidget {
  const DetailedTransactionHistoryWidget({Key? key}) : super(key: key);

  @override
  State<DetailedTransactionHistoryWidget> createState() => _DetailedTransactionHistoryWidgetState();
}

class _DetailedTransactionHistoryWidgetState extends State<DetailedTransactionHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomTextWidget(
            title: 'Detailed_transaction_history'.tr,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(height: 3.h),
        CustomContainerBoxShadow(
          padding: EdgeInsets.only(left: 10,right: 10),
          radius: 10,
          height: 7.h,
          widgetContainer: NewWidgetRowText(
              color: Theme.of(context).iconTheme.color,
              text1: 'Operation_No'.tr,
              text2: 'ID_No'.tr,
              text3: 'Amount_transferred'.tr,
              text4: 'Date'.tr),
        ),
        SizedBox(height: 1.h),
        Padding(
          padding: EdgeInsets.only(left: 8,right: 8),
          child: NewWidgetRowText(
              color: Theme.of(context).iconTheme.color,
              text1: '15501#' ,
              text2: '5055158',
              text3: '200',
              text4: '8/2/2022'),
        ),
        SizedBox(height: 1.h),
        Padding(
          padding: EdgeInsets.only(left: 8,right: 8),
          child: NewWidgetRowText(
              color: Theme.of(context).iconTheme.color,
              text1:  '16601#' ,
              text2: '5055157',
              text3: '200',
              text4: '8/2/2022'),
        ),
      ],
    );
  }
}
