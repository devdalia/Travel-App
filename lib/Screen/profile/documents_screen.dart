import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/widget/loading_widget.dart';
import 'package:amwaj_car/widget/new_widget_add_escorts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';
import '../../widget/widget_container_button_custom.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (UserController logic) {
        var data = logic.getDocumentationModel.data?.documentationsUser;
        return NewWidgetHeaderScreen(
          onClickLeading: () => Get.back(),
          padding: 15,
          widget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                    title: 'documents'.tr,
                    size: 20,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 3.5.h),
                CustomContainerBoxShadow(
                  width: double.infinity,
                  radius: 10,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 25),
                  widgetContainer: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 5.w),
                            Expanded(
                              child: NewWidgetContainerCustom(
                                text: 'passport'.tr,
                                colorText: logic.indexDocumentation.value == 0
                                    ? Colors.white
                                    : Theme.of(context).cardTheme.color!,
                                border: logic.indexDocumentation.value == 0
                                    ? false
                                    : true,
                                fillColor: logic.indexDocumentation.value == 0
                                    ? true
                                    : false,
                                radius: 15,
                                onTap: () => logic.changeDocumentationIndex(0),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: NewWidgetContainerCustom(
                                text: 'escorts'.tr,
                                colorText: logic.indexDocumentation.value == 1 ? Colors.white : Theme.of(context).cardTheme.color!,
                                border: logic.indexDocumentation.value == 1 ? false : true,
                                fillColor: logic.indexDocumentation.value == 1 ? true : false,
                                radius: 15,
                                onTap: () {
                                  logic.changeDocumentationIndex(1);
                                     }
                              ),
                            ),
                            SizedBox(width: 5.w),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        if (logic.indexDocumentation.value == 0)
                          logic.profileLoading.value
                              ? LoadingWidget()
                              : buildStackBodyTravel(
                                  logic.profileModel.data?.passportNum ?? "",
                                  logic.profileModel.data?.name ?? "",
                                  logic.profileModel.data?.birthDate ?? ""),
                        if (logic.indexDocumentation.value == 1)
                          logic.getDocumentationLoading.value
                              ? LoadingWidget()
                              : Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 2.h),
                                        CustomContainerBoxShadow(
                                          width: double.infinity,
                                          radius: 10,
                                          padding: EdgeInsets.only(left: 15, right: 15, top: 35, bottom: 25),
                                          border: true,
                                          widgetContainer: Column(
                                            children: [
                                              ListView.builder(
                                                itemCount: data?.length,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  var dataClient = data?[index].client;
                                                  return Container(
                                                    padding: EdgeInsets.only(top: 3, bottom: 3),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        CustomContainerBoxShadow(
                                                          radius: 10,
                                                          width: 35.w,
                                                          height: 7.5.h,
                                                          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                                                          widgetContainer:
                                                              Center(
                                                            child: CustomTextWidget(
                                                                title: dataClient
                                                                        ?.passportNum ??
                                                                    "",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline3),
                                                          ),
                                                        ),
                                                        SizedBox(width: 2.w),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          children: [
                                                            CustomTextWidget(
                                                              title: dataClient
                                                                      ?.name ??
                                                                  "",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                            ),
                                                            CustomTextWidget(
                                                              title: dataClient
                                                                      ?.birthDate ??
                                                                  "",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(height: 2.h),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () => logic
                                                            .addDocumentation(
                                                                context:
                                                                    context),
                                                        child:
                                                            CustomContainerBoxShadow(
                                                          radius: 10,
                                                          height: 10.0.h,
                                                          width: 25.w,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          widgetContainer:
                                                              Center(
                                                            child: logic.addDocumentationLoading.value
                                                                ? LoadingWidget()
                                                                : CustomTextWidget(
                                                                    title: '+',
                                                                    color: Theme.of(context).accentColor,
                                                                    fontWeight: FontWeight.bold, size: 30,
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 3.w),
                                                      Expanded(
                                                        child: CustomContainerBoxShadow(
                                                          padding: EdgeInsets.zero,
                                                          radius: 5,
                                                          widgetContainer: Row(
                                                            children: [
                                                              NewWidgetAddEscorts(
                                                                title: 'Passport_No'.tr,
                                                                left: true,
                                                                controller: logic.passport_numDocumentationController,
                                                              ),
                                                              NewWidgetAddEscorts(
                                                                  title: 'Birth_date'.tr,
                                                                  controller: logic.birth_dateDocumentationController,
                                                                  left: false),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7.h,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 0,
                                      right:HiveController().languageCode == 'ar'? 5.w:null,
                                      left:HiveController().languageCode == 'en'?2.w:null,
                                      child: CustomContainerBoxShadow(
                                        radius: 20,
                                        padding: EdgeInsets.only(left: 15, right: 15),
                                        widgetContainer: CustomTextWidget(
                                            title: 'escorts'.tr,
                                            style: Theme.of(context).textTheme.headline3),
                                      ),
                                    )
                                  ],
                                ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Stack buildStackBodyTravel(String number, String name, String date) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            SizedBox(height: 2.h),
            CustomContainerBoxShadow(
              width: double.infinity,
              radius: 10,
              padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 15),
              border: true,
              widgetContainer: Column(
                children: [
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainerBoxShadow(
                        radius: 10,
                        width: 35.w,
                        height: 7.5.h,
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                        widgetContainer: Center(
                          child: CustomTextWidget(
                              title: number,
                              style: Theme.of(context).textTheme.headline3),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextWidget(
                            title: name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          CustomTextWidget(
                            title: date,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right:HiveController().languageCode == 'ar'? 5.w:null,
          left:HiveController().languageCode == 'en'?2.w:null,
          child: CustomContainerBoxShadow(
            radius: 20,
            padding: EdgeInsets.only(left: 15, right: 15),
            widgetContainer: CustomTextWidget(
                title: 'client_travel_document'.tr,
                style: Theme.of(context).textTheme.headline3),
          ),
        )
      ],
    );
  }
}
