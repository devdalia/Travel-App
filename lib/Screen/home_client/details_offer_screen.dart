import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';

class DetailsOfferScreen extends StatefulWidget {
  const DetailsOfferScreen({Key? key}) : super(key: key);

  @override
  State<DetailsOfferScreen> createState() => _DetailsOfferScreenState();
}

class _DetailsOfferScreenState extends State<DetailsOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () => Get.back(),
      padding: 20,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/images/offer-1.png',
                fit: BoxFit.contain,
              )),
          CustomTextWidget(
              title: 'new_offer'.tr, size: 20, fontWeight: FontWeight.bold),
          SizedBox(height: 2.h),
          CustomContainerBoxShadow(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            height: 13.h,
            widgetContainer: Center(
              child: CustomTextWidget(
                  title: 'Travel_comfortably'.tr,
                  size: 18,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5.h),
          CustomContainerBoxShadow(
            width: double.infinity,
            padding: EdgeInsets.all(15),

            ///     height: 13.h,
            widgetContainer: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                    title: 'Terms_Conditions'.tr,
                    size: 18,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold),
                SizedBox(height: 2.h),
                buildRow(
                    'Offer_only_for_those_who_book_more_than_2000_points'.tr),
                SizedBox(height: 1.h),
                buildRow('Offer_period_until_February'.tr),
                SizedBox(height: 1.h),
                buildRow(
                    'The_Mertah_application_has_the_right_cancel_the_points_or_close_the_account'
                        .tr),
                SizedBox(height: 7.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color, shape: BoxShape.circle),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: CustomTextWidget(
            title: title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        )
      ],
    );
  }
}
