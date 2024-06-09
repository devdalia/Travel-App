import 'package:amwaj_car/controllers/AppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'custom_container_box_shadow.dart';
import 'custom_text_widget.dart';
class DisplayPostalWidget extends StatelessWidget {
  const DisplayPostalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: CustomContainerBoxShadow(
            padding: EdgeInsets.zero,
            colorFill: Theme.of(context).scaffoldBackgroundColor,
            border: true,
            widgetContainer: Column(
              children: [
                SizedBox(height: 4.h),

                /*            Container(
                          width: double.infinity,
                          child: DataTable(
                            headingRowHeight: 6.h,
                            dataRowHeight: 8.h,
                               showBottomBorder: false,
                            showCheckboxColumn: false,

                            border:TableBorder.all(  style: BorderStyle.none) ,
                            columnSpacing: 20,
                            horizontalMargin: 5,
                            dividerThickness: 1.3.h,

                            decoration: BoxDecoration(
                              color:  Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),

                         ///     border: Border.all(color: Theme.of(context).accentColor),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.2, 0.2),
                                    blurRadius: 7,
                                    color:Theme.of(context).shadowColor),
                              ],
                            ),

                            ///  defaultVerticalAlignment:TableCellVerticalAlignment.middle ,


                            columns: [
                              DataColumn(
                                  label:
                                  Center(
                                    child: CustomTextWidget(
                                        title: 'Code'.tr,
                                        style: Theme.of(context).textTheme.bodyText1),
                                  )),
                              DataColumn(
                                  label:
                                  Center(
                                    child: CustomTextWidget(
                                        title: 'track'.tr,
                                        style: Theme.of(context).textTheme.bodyText1),
                                  )),
                              DataColumn(
                                  label:
                                  Center(
                                    child: CustomTextWidget(
                                        title: 'Status'.tr,
                                        style: Theme.of(context).textTheme.bodyText1),
                                  )),

                            ],

                            rows: [
                              DataRow(
                                  cells: [
                                    DataCell(
                                      CustomTextWidget(
                                          title: ' S01YS0001',
                                          style: Theme.of(context).textTheme.bodyText1),
                                    ),

                                    DataCell(CustomTextWidget(
                                        title: 'awaiting_parcel'.tr,
                                        style: Theme.of(context).textTheme.bodyText1))  ,
                                    DataCell(
                                        Image.asset('assets/images/check-color.png',width: 30,fit: BoxFit.cover ))


                                  ]
                              ),
                              DataRow(
                                  cells: [
                                    DataCell(
                                      CustomTextWidget(
                                          title: ' S01YS0001',
                                          style: Theme.of(context).textTheme.bodyText1),
                                    ),

                                    DataCell(CustomTextWidget(
                                        title: 'is_being_prepared'.tr,
                                        style: Theme.of(context).textTheme.bodyText1))  ,

                                    DataCell(
                                        Image.asset('assets/images/check.png',width: 30,fit: BoxFit.cover,))

                                  ]
                              ),
                              DataRow(
                                  cells: [
                                    DataCell(
                                      CustomTextWidget(
                                          title: ' S01YS0001',
                                          style: Theme.of(context).textTheme.bodyText1),
                                    ),

                                    DataCell(CustomTextWidget(
                                        title: 'in_the_way'.tr,
                                        style: Theme.of(context).textTheme.bodyText1))  ,

                                    DataCell(
                                        Image.asset('assets/images/check.png',width: 30,fit: BoxFit.cover,))
                                  ]
                              ),
                              DataRow(
                                  cells: [
                                    DataCell(
                                      CustomTextWidget(
                                          title: ' S01YS0001',
                                          style: Theme.of(context).textTheme.bodyText1),
                                    ),

                                    DataCell(CustomTextWidget(
                                        title: 'Arrived'.tr,
                                        style: Theme.of(context).textTheme.bodyText1))  ,

                                    DataCell(
                                        Image.asset('assets/images/check.png',width: 30,fit: BoxFit.cover,))
                                  ]
                              ),


                            ],

                          ),
                        ),*/

                SizedBox(height: 3.h),
                CustomContainerBoxShadow  (
                  padding: EdgeInsets.all(12),
                  radius: 10,

                  widgetContainer: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        child: CustomTextWidget(
                            title: 'Code'.tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(child: Container()),
                      Expanded(
                        child: CustomTextWidget(
                            title: 'track'.tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(child: Container()),
                      Expanded(
                        child: CustomTextWidget(
                            title: 'Status'.tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 1.h),

                buildCustomContainerBoxShadow(context,'S01YS0001','awaiting_parcel'.tr,true),
                SizedBox(height: 1.h),
                buildCustomContainerBoxShadow(context,'S01YS0001','is_being_prepared'.tr,false),
                SizedBox(height: 1.h),
                buildCustomContainerBoxShadow(context,'S01YS0001','in_the_way'.tr,false),
                SizedBox(height: 1.h),
                buildCustomContainerBoxShadow(context,'S01YS0001','Arrived'.tr,false),


                SizedBox(height:10.h),
              ],
            ),
          ),
        ),
        Positioned(
          right : 8.w,
          top: -2.h,
          child: Container(
            height: 5.h,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(50)
            ),
            padding: EdgeInsets.only(left: 25,right: 25),
            child:      CustomTextWidget(
              title: 'postal'.tr,
              style: Theme.of(context).textTheme.headline1, ),
          ),
        )
      ],
    );
  }
    Widget buildCustomContainerBoxShadow(BuildContext context,String code,String track,bool status) {
    return InkWell(
      onTap: ()=>AppController.to.typePostalScreen.value='details',
      child: CustomContainerBoxShadow(
        padding: EdgeInsets.all(2),
        radius: 0,
        widgetContainer: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTextWidget(
                  title: code,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2),
            ),
            Expanded(child: Container()),
            Expanded(
              child: CustomTextWidget(
                  title: track,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2),
            ),
            Expanded(child: Container()),
            Expanded(child: Container(
                height: 25,
                width: 25,
                child: Image.asset(status==true?'assets/images/check-color.png':'assets/images/check.png',width: 30,fit: BoxFit.contain ))),
            //    Container(),
          ],
        ),
      ),
    );
  }

}
