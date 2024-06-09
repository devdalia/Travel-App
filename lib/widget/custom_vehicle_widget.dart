import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/alert_reservation_complete.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:amwaj_car/widget/widget_container_button_custom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomVehicleWidget extends StatefulWidget {
  String title;
  bool car;

  CustomVehicleWidget({Key? key, required this.title, this.car = true})
      : super(key: key);

  @override
  State<CustomVehicleWidget> createState() => _CustomVehicleWidgetState();
}

class _CustomVehicleWidgetState extends State<CustomVehicleWidget> {
  final List<String> imgList = [
    'assets/images/Lamborghini.png',
    'assets/images/Lamborghini.png',
    'assets/images/Lamborghini.png',
    'assets/images/Lamborghini.png',
  ];
int activeIndex=0;
final controller=CarouselController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            alignment: Alignment.bottomCenter,
            insetPadding: EdgeInsets.all(15),
       backgroundColor: Theme.of(context).cardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lamborghini',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color:  Theme.of(context).iconTheme.color),
              ),
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter StatefulBuilder)=> Container(
                width: MediaQuery.of(context).size.width - 20,
                height:  HiveController().languageCode == 'en'?40.h:37.h,
                margin: EdgeInsets.only(top: 20, bottom: 15,left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: next,
                          icon: Icon(Icons.arrow_back_ios,size: 40,)),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: CarouselSlider.builder(
                            carouselController: controller ,
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
                              activeIndex=index;
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
                        IconButton(onPressed:previous, icon: Icon(Icons.arrow_forward_ios,size: 40,)),
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
                            widgetContainer:    Column(
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
                                    buildContainer(Color(0xff929292).withOpacity(.50)),
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
                              ),     CustomTextWidget(
                                title: 'Hour 10 - 8' ,
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
                              ),     CustomTextWidget(
                                title: '155\$' ,
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
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          color:Theme.of(context).cardTheme.color,
                          width:2.5,
                          height: 3.h,
                        ),
                        SizedBox(width:2.w),
                        CustomTextWidget(
                          title: 'Vehicle_Features'.tr,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    CustomTextWidget(
                      title: 'Comfortable_seating_Internet_service_Display_Screen'.tr,
                      style: Theme.of(context).textTheme.caption,
                      textAlign: HiveController().languageCode == 'en'?TextAlign.left:TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NewWidgetContainerCustom(
                    text: 'Book_now'.tr,
                    fillColor: true,
                    width: 35.w,
                    radius: 10,
                    colorText: Colors.white,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    onTap: () => reservationCompleted(context),
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
      },
      child: CustomContainerBoxShadow(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 3),
          radius: 0,
          height: 7.h,
          width: 30.w,
          widgetContainer: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: HiveController().languageCode == 'ar'
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Container(
                  width: 13,
                  height: 13,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          width: 2)),
                ),
              ),
              SizedBox(width: 2.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextWidget(
                    title: widget.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(width: 2.w),
                  Image.asset(
                    widget.car == true
                        ? 'assets/images/car.png'
                        : 'assets/images/jeep.png',
                    width: 30,
                    color: Theme.of(context).iconTheme.color,
                  )
                ],
              )
            ],
          )),
    );
  }

  Container buildContainer(Color color) {
    return Container(
                                    width: 12,
                                    height: 12,

                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:color
                                    ),
                                  );
  }

  void next()=>controller.nextPage(duration: Duration(milliseconds: 500));
  void previous()=>controller.previousPage(duration: Duration(milliseconds: 500));
}
