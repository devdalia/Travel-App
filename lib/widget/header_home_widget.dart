import 'package:amwaj_car/Screen/Reservations/reservations_screen.dart';
import 'package:amwaj_car/helpers/binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:sizer/sizer.dart';

import '../local_storage/shared_preferences/preferences.dart';
import 'custom_text_widget.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: 200,

          ///   color: Colors.grey,
        ),
        ClipPath(
          clipper: ProsteBezierCurve(
            position: ClipPosition.bottom,
            list: [
              BezierCurveSection(
                start: Offset(0, 150),
                top: Offset(screenWidth / 2, 200),
                end: Offset(screenWidth, 150),
              ),
            ],
          ),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/background-home.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  /// color: Color(0xff7E57C2).withOpacity(.5)
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff7E57C2).withOpacity(.75),
                        Color(0xff960C7B).withOpacity(.75),
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    if(HiveController().token != '')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: HiveController().languageCode == 'ar'
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          children: [
                            Icon( Icons.notifications_none_sharp,color:Colors.white,size: 35,),
                            Positioned(
                              right: HiveController().languageCode == 'ar'?-2.7.w:0,
                              left: HiveController().languageCode == 'en'?-2.9.w:0,
                              top: 0.8.h,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                        InkWell(
                            onTap: ()=>  Get.to(ReservationsScreen(),binding: Binding()),
                            child: Icon(CupertinoIcons.tickets,color:Colors.white,size: 35,)),

                      ],
                    ),
                    SizedBox(height: 20),    
                    InkWell(
                      onTap: () {
                        if (HiveController().languageCode == 'ar') {
                          HiveController().setLanguage('en');
                          Get.updateLocale(Locale('en', ''));
                        } else if (HiveController().languageCode == 'en') {
                          HiveController().setLanguage('ar');
                          Get.updateLocale(Locale('ar', ''));
                        }
                      },
                      child: Align(
                        alignment: HiveController().languageCode == 'ar'
                            ? Alignment.centerLeft
                            : Alignment.centerLeft,
                        child: Stack(
                          alignment: HiveController().languageCode == 'ar'
                              ? Alignment.topCenter
                              : Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icon-coment.png",
                              fit: BoxFit.contain,
                              width: 45,
                            ),
                            CustomTextWidget(
                                title: HiveController().languageCode == 'ar'
                                    ? 'EN'
                                    : "AR",
                                color: Colors.white,
                                size: 15,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Center(
                      child: CustomTextWidget(
                          title: 'Let_us_insure_your_comfort'.tr,
                          color: Colors.white,
                          size: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
