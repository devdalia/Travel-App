import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/AppController.dart';
import '../local_storage/shared_preferences/preferences.dart';
import 'custom_text_widget.dart';

class CustomerAccountsChargingWidget extends StatefulWidget {
  const CustomerAccountsChargingWidget({Key? key}) : super(key: key);

  @override
  State<CustomerAccountsChargingWidget> createState() =>
      _CustomerAccountsChargingWidgetState();
}

class _CustomerAccountsChargingWidgetState
    extends State<CustomerAccountsChargingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Material(
           elevation: 20,
           color:  Theme.of(context).cardColor,
           borderRadius: BorderRadius.only(
             bottomRight: Radius.circular(20),
             bottomLeft: Radius.circular(20),
           ),
           child: Container (
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:  Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:EdgeInsets.only( top: 30),
                  child: Row(
                    children: [
                      Container(
                          width: 43,
                          height: 43,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.2, 0.2),
                                  blurRadius: 7,
                                  color: Theme.of(context).shadowColor),
                            ],
                            color: Theme.of(context).cardColor,
                          )),
                      CustomTextWidget(
                        title: 'Noor Ali',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Spacer(),
                      CustomTextWidget(
                        title: '20000',
                        color: Color(0xffDABF03),
                        size: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).iconTheme.color!,
                                width: .5)),
                        child: CustomTextWidget(
                          title: '\$',
                          color: Color(0xffDABF03),
                          size: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      CustomTextWidget(
                        title: 'Customer_Accounts_Charging_Screen'.tr,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      InkWell(
                          onTap: () =>  AppController.to.homeClient.value =
                          'Detailed_transaction_history',
                          child: Icon(CupertinoIcons.arrow_clockwise, size: 25))
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainerBoxShadow(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      radius: 5,
                      height: 7.h,
                      width: 30.w,
                      widgetContainer: Center(
                        child: CustomTextWidget(
                          title: 'Customer_Code_No'.tr,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    CustomContainerBoxShadow(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      radius: 5,
                      height: 7.h,
                      width: 25.w,
                      widgetContainer: Center(
                        child: CustomTextWidget(
                          title: 'Amount'.tr,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    Center(
                      child: CustomContainerBoxShadow(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        radius: 5,
                        height: 7.h,
                        width: 25.w,
                        widgetContainer: Center(
                          child: CustomTextWidget(
                            title: 'add'.tr,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Container(
                  width: double.infinity,
                  height: 1.3,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: 3.h),
                buildRow('Code_No'.tr, 'Customer_Code_No'.tr,
                    'Execution_order'.tr, false),
                SizedBox(height: 2.h),
                buildRow('5055158', '200', 'Execution_order'.tr, true),
                SizedBox(height: 1.5.h),
                buildRow('5055158', '200', 'Execution_order'.tr, true),
                SizedBox(height: 7.5.h),
                Align(
                  alignment: HiveController().languageCode == 'ar'
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: buildTransform(),
                )
              ],
            ),
        ),
         ),
      ],
    );
  }

  Widget buildRow(String title1, String title2, String title3, bool button) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          title: title1,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        CustomTextWidget(
          title: title2,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        button == false
            ? CustomTextWidget(
                title: title3,
                style: Theme.of(context).textTheme.bodyText2,
              )
            : buildTransform(),
      ],
    );
  }

  CustomContainerBoxShadow buildTransform() {
    return CustomContainerBoxShadow(
      padding: EdgeInsets.zero,
      height: 4.h,
      radius: 5,
      width: 20.w,
      widgetContainer: CustomTextWidget(
        title: 'transform'.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
