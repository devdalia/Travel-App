import 'dart:io';

import 'package:amwaj_car/controllers/AccountRecovery_controller.dart';
import 'package:amwaj_car/controllers/Driver_controller.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/widget_container_button_custom.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../controllers/User_controller.dart';
import 'custom_button_widget.dart';
import 'custom_container_box_shadow.dart';
import 'custom_text_widget.dart';



XFile? pickedFile;

Future imagePicker(ImageSource source, String type) async {
  final ImagePicker _picker = ImagePicker();
  pickedFile = await _picker.pickImage(source: source, imageQuality: 40);
  if (pickedFile != null) {
    if (type == 'recovery') {
      AccountRecoveryController.to.passportImagesFile = pickedFile;
      Get.back();
    }
    if (type == 'create') {
      UserController.to.passportImagesFile = pickedFile;
    }
  }
}

Future<dynamic> imagePickerDialog(
    {required BuildContext context, required String type}) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(40, 5, 40, 5),
      insetPadding: EdgeInsets.all(15),
      backgroundColor: Theme.of(context).dividerColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Center(
        child: CustomTextWidget(
          title: 'travel_document_photo'.tr,
          size: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 20.h,
        margin: EdgeInsets.only(top: 25, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewWidgetContainerCustom(
              text: 'Take_a_photo'.tr,
              fillColor: true,
              width: 55.w,
              radius: 10,
              colorText: Colors.white,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              onTap: () => imagePicker(ImageSource.camera, type),
            ),
            SizedBox(height: 2.h),
            NewWidgetContainerCustom(
              text: 'Choose_a_photo'.tr,
              fillColor: true,
              width: 55.w,
              radius: 10,
              colorText: Colors.white,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              onTap: () => imagePicker(ImageSource.gallery, type),
            )
          ],
        ),
      ),
    ),
  );
}

Future<dynamic> openTripDialog({required BuildContext context}) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      insetPadding: EdgeInsets.all(15),
      backgroundColor: Theme.of(context).dividerColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Center(
        child: CustomTextWidget(
          title: 'Flight_view'.tr,
          size: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: GetBuilder<DriverController>(
        init: DriverController(),
        builder: (logic) {
          return Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.only(top: 25, bottom: 15),
              child: logic.openJourneyModel.data!.isNotEmpty
                  ? ListView.builder(
                      itemCount: logic.openJourneyModel.data?.length,
                      itemBuilder: (context, index) {
                        var data = logic.openJourneyModel.data?[index];
                        return Container(
                          margin: EdgeInsets.only(top: 7, bottom: 7),
                          width: double.infinity,
                          child: CustomContainerBoxShadow(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            radius: 24,
                            border: false,
                            colorFill: Color(0xff81BCD9).withOpacity(.20),
                            widgetContainer: Row(
                              children: [
                                Container(
                                  height: 9,
                                  width: 9,
                                  decoration: BoxDecoration(
                                      color: kPrimerColor,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(width: 2.w),
                                CustomTextWidget(
                                  title: data?.client?.passportNum ?? '',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Container(
                                  width: 1.3,
                                  margin: EdgeInsets.only(left: 7, right: 7),
                                  height: 4.h,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  /// width: 23.w,
                                  child: CustomTextWidget(
                                      title: data?.client?.name ?? '',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                      maxLines: 1),
                                ),
                                // Spacer(),
                                // InkWell(
                                //   onTap: ()=>logic.cancelConfirmReservation(context,data?.id??0,int.parse(data?.jurneyNum??'')),
                                //   child: CustomTextWidget(
                                //     title: 'Cancel'.tr,
                                //     color: Colors.red,
                                //     size: 17,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Container());
        },
      ),
    ),
  );
}

Future<dynamic> customizationDialog({required BuildContext context}) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        alignment: Alignment.center,
        insetPadding: EdgeInsets.all(15),
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'customization'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).iconTheme.color),
        ),
        content: GetBuilder<UserController>(
          init: UserController(),
          builder: (logic) => Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 20.h,
            margin: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
            padding: EdgeInsets.only(left: 30, right: 30),
            child: ListView.builder(
                itemCount: logic.typeCarModel.data?.length,
                itemBuilder: (context, index) {
                  var car = UserController.to.typeCarModel.data?[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: NewWidgetContainerCustom(
                      text: car?.type ?? '',
                      fillColor: true,
                      width: 55.w,
                      radius: 10,
                      colorText: Colors.white,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      onTap: () {
                        logic.getDetailsTypeCart(context, car?.id ?? 0);
                      },
                    ),
                  );
                }),
          ),
        )),
  );
}

final List<String> imgList = [
  'assets/images/Lamborghini.png',
  'assets/images/Lamborghini.png',
  'assets/images/Lamborghini.png',
  'assets/images/Lamborghini.png',
];
int activeIndex = 0;
final controller = CarouselController();

Future<dynamic> detailsCarDialog({required BuildContext context}) async {
  var data = UserController.to.detailsTypeCarModel.data;
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.all(15),
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          data?.first.name ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).iconTheme.color),
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter StatefulBuilder) =>
            Container(
          width: MediaQuery.of(context).size.width - 20,
          height: HiveController().languageCode == 'en' ? 40.h : 37.h,
          margin: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: next,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                      )),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: CarouselSlider.builder(
                      carouselController: controller,
                      options: CarouselOptions(
                        aspectRatio: 2,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        reverse: true,
                        enableInfiniteScroll: false,
                        initialPage: activeIndex,
                        autoPlay: false,
                      ),
                      itemCount: imgList.length,
                      itemBuilder: (context, index, realIndex) {
                        activeIndex = index;
                        final image = imgList[index];
                        return Image.asset(
                          image,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 2.w),
                  IconButton(
                      onPressed: previous,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 40,
                      )),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                height: 9.5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainerBoxShadow(
                      radius: 10,
                      height: 9.5.h,
                      width: 21.w,
                      colorFill: Theme.of(context).highlightColor,
                      padding: EdgeInsets.all(4),
                      widgetContainer: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextWidget(
                            title: 'Colors'.tr,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildContainer(Colors.black),
                              buildContainer(
                                  Color(0xff929292).withOpacity(.50)),
                              buildContainer(Colors.red.withOpacity(.50)),
                              buildContainer(Colors.white),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          title: 'Access_time'.tr,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        CustomTextWidget(
                          title:
                              'Hour ${data?.first.currentLoading ?? ""} - ${data?.first.maxLoading ?? ""} ',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          title: 'price'.tr,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        CustomTextWidget(
                          title: '${data?.first.price ?? ""}\$ ',
                          color: kMainColor22,
                          size: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    color: Theme.of(context).cardTheme.color,
                    width: 2.5,
                    height: 3.h,
                  ),
                  SizedBox(width: 2.w),
                  CustomTextWidget(
                    title: 'Vehicle_Features'.tr,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              CustomTextWidget(
                title: data?.first.features ?? "",
                style: Theme.of(context).textTheme.caption,
                textAlign: HiveController().languageCode == 'en'
                    ? TextAlign.left
                    : TextAlign.right,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetBuilder<UserController>(
              init: UserController(),
              builder: (logic) => NewWidgetContainerCustom(
                text: 'Book_now'.tr,
                fillColor: true,
                width: 35.w,
                radius: 10,
                loading: logic.addedCarToReservationLoading.value,
                colorText: Colors.white,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                onTap: () => logic.addedCarToReservation(context: context),
              ),
            ),
            NewWidgetContainerCustom(
              text: 'Cancel'.tr,
              width: 35.w,
              colorText: Theme.of(context).cardTheme.color!,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
        SizedBox(
          height: 2.5.h,
        )
      ],
    ),
  );
}

Container buildContainer(Color color) {
  return Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}

void next() => controller.nextPage(duration: Duration(milliseconds: 500));

void previous() =>
    controller.previousPage(duration: Duration(milliseconds: 500));



Future<dynamic> updateImageProfileDialog({required BuildContext context}) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.all(15),
        alignment: Alignment.center,
        insetPadding: EdgeInsets.all(15),
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: GetBuilder<UserController>(
          init: UserController(),
          builder: (logic) => Container(
         ///   width: MediaQuery.of(context).size.width - 50,
            height: 30.h,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    logic.selectImage();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 13.0.h,
                        width: 25.0.w,
                        decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(.5),
                        shape: BoxShape.circle),
                        child: logic.profileImage != null ?Image.file(File(logic.profileImage?.path ?? ''),fit: BoxFit.cover,):
                        Icon(Icons.camera_alt_outlined, color:Colors.white,size: 25.sp,)
                      ),


                    ],
                  ),
                ),

                CustomButtonWidget(
                    width: 47.0.w,
                    height: 55,
                    loading: logic.updateProfileLoading.value,
                    color: [
                      Color(0xffB003CB),
                      Color(0xff60026F),
                    ],
                    onClick: () =>logic.updateProfileUser(context: context),
                    title: "edit".tr)
              ],
            ),
          ),
        )),
  );
}