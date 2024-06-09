import 'dart:developer';

import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/models/TypeReservationModel.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';
import '../models/GetDocumentationModel.dart';
import 'check_box.dart';

class IndividualsWidget extends StatefulWidget {
  const IndividualsWidget({Key? key}) : super(key: key);

  @override
  State<IndividualsWidget> createState() => _IndividualsWidgetState();
}

class _IndividualsWidgetState extends State<IndividualsWidget> {
  DataType? type;
  DocumentationsUser? documentationsUser;
  List<DocumentationsUser>? list = [];
  bool checkReturn = false;
  bool checkA_one_way = false;

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: UserController(),
      builder: (logic) {
        if (logic.getPointsCountTravelerLoading.value ||
            logic.addTypeReservationsLoading.value) {
          return LoadingWidget();
        }
        for (int i = 0; i < logic.typeReservationModel.data!.length; i++) {
          if (logic.typeReservationModel.data![i].id ==
              int.parse(logic.selectType.toString())) {
            type = logic.typeReservationModel.data![i];
          }
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NewWidgetCheckBox(
                  title: 'Return_ticket'.tr,
                  click: () {
                    UserController.to.travel.value = 1;
                  },
                  widget: UserController.to.travel.value == 1
                      ? Icon(
                          Icons.check,
                          color: kMainColor,
                          size: 12.sp,
                        )
                      : Container(),
                ),
                SizedBox(height: 1.5.h),
                NewWidgetCheckBox(
                  title: 'A_one_way_ticket'.tr,
                  click: () {
                    UserController.to.travel.value = 0;
                  },
                  widget: UserController.to.travel.value == 0
                      ? Icon(
                          Icons.check,
                          color: kMainColor,
                          size: 12.sp,
                        )
                      : Container(),
                ),
              ],
            ),
            SizedBox(height: 2.5.h),
            logic.selectType.value != '1'
                ? Row(
                    children: [
                      CustomTextWidget(
                        title: 'individuals'.tr,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Spacer(),
                      CustomTextWidget(
                        title: logic.getPointsCountTravelerModel.data
                                ?.totalPointsCountReservation
                                .toString() ??
                            "",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      CustomTextWidget(
                        title: 'Reserved_Points'.tr,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  )
                : CustomTextWidget(
                    textAlign: TextAlign.center,
                    title: logic.notGetPointsCountTravelerModel.message,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
            SizedBox(height: 3.h),
            Container(
              width: double.infinity,

              ///   height: 20.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                ///    shrinkWrap: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        child: buildColumn(
                            context,
                            logic.profileModel.data?.passportNum.toString() ??
                                "",
                            '-${type?.pointsCount} ')),
                    if (list!.isNotEmpty)
                      ...list!.map((e) {
                        return Container(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            child: buildColumn(
                                context,
                                documentationsUser?.client?.passportNum ?? "",
                                '-${type?.pointsCount} '));
                      }).toList(),
                    SizedBox(width: 2.w),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => logic.addIndividual(),
                          child: CustomContainerBoxShadow(
                              padding: EdgeInsets.only(bottom: 0),
                              radius: 0,
                              height: 7.h,
                              width: 23.w,
                              widgetContainer: Icon(
                                Icons.add_outlined,
                                color: Color(0xff0082C0),
                                size: 40,
                              )),
                        ),
                        SizedBox(height: 2.h),
                        if (logic.addIndividuals.value == '1')
                          ...logic
                              .getDocumentationModel.data!.documentationsUser!
                              .map((e) => InkWell(
                                    onTap: () {
                                      logic.addIndividual();
                                      setState(() {
                                        list?.add(DocumentationsUser(id: e.id));
                                        for (var item in logic
                                            .getDocumentationModel
                                            .data!
                                            .documentationsUser!) {
                                          if (e.id == item.id) {
                                            documentationsUser = item;
                                          }
                                        }
                                      });

                                      log('list listDocumentationsUser ${list} ');
                                      log('list listDocumentationsUser  e.id ${e.id} ');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: CustomContainerBoxShadow(
                                        padding: EdgeInsets.only(bottom: 0),
                                        radius: 0,
                                        width: 23.w,
                                        height: 7.h,
                                        widgetContainer: Center(
                                          child: CustomTextWidget(
                                            title: e.client?.passportNum ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Column buildColumn(BuildContext context, String passportNum, String value) {
    return Column(
      children: [
        CustomContainerBoxShadow(
          padding: EdgeInsets.only(bottom: 0),
          radius: 0,
          width: 23.w,
          height: 7.h,
          widgetContainer: Column(
            children: [
              Align(
                  alignment: HiveController().languageCode == 'ar'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Image.asset(HiveController().languageCode == 'ar'
                      ? 'assets/images/triangle-shape.png'
                      : 'assets/images/triangle-ds.png')),
              Center(
                child: CustomTextWidget(
                  title: passportNum,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        CustomTextWidget(
          title: 'passenger_seat'.tr,
          style: Theme.of(context).textTheme.caption,
        ),
        CustomTextWidget(
          title: value + 'Point'.tr,
          size: 15,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
