import 'package:amwaj_car/Screen/home_client/postal_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/AppController.dart';
import '../../../local_storage/shared_preferences/preferences.dart';
import '../../../widget/custom_button_widget.dart';
import '../../../widget/custom_container_box_shadow.dart';
import '../../../widget/custom_text_widget.dart';
import '../../../widget/header_home_widget.dart';
import '../delivery_nav/delivery_screen.dart';
import '../packages_screen.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({Key? key}) : super(key: key);

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      'Delivery'.tr,
      'postal'.tr,
      'Packages'.tr,
      'formats'.tr,
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderHomeWidget(),
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(titleList.length, (index) {
                return InkWell(
                  onTap: (){
                    if(index==1){
                      Get.to(PostalScreen());
                    }else if(index==2){
                      Get.to(PackagesScreen());
                    }else if(index==0){
                      Get.to(DeliveryScreen());
                    }
                  },
                  child: Stack(
                    children: [
                      CustomContainerBoxShadow(
                        padding: EdgeInsets.zero,
                        radius: 20,
                        widgetContainer: Center(
                          child: CustomTextWidget(
                              title: titleList[index],
                              style: Theme.of(context).textTheme.headline3),
                        ),
                      ),
                      if (index == 3)
                        Align(
                          alignment: HiveController().languageCode == 'ar'
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: CustomContainerBoxShadow(
                            padding: EdgeInsets.zero,
                            width: 13.5.w,
                            height: 4.h,
                            colorFill: Color(0xffB703D3),
                            radius: 14,
                            widgetContainer: Center(
                              child: CustomTextWidget(
                                title: 'soon'.tr,
                                size: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              })),
          AppController.to.login.value == 'no'
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    CustomTextWidget(
                        title: 'You_are_not_logged_in'.tr,
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(height: 1.0.h),
                    CustomTextWidget(
                        title: 'Login_to_benefit_from_the_services'.tr,
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(height: 3.h),
                    CustomButtonWidget(
                      color: [
                        Color(0xffB003CB),
                        Color(0xff60026F),
                      ],
                      width: 55.0.w,
                      onClick: () {
                        AppController.to.changeIndex(1);
                      },
                      title: 'Login'.tr,
                    )
                  ],
                )
              : Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 4.5.h,
                            width: 4,
                            decoration: BoxDecoration(
                                color: Color(0xff810A93),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(width: 1.5.w),
                          CustomTextWidget(
                            title: 'Offers'.tr,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Container(
                        height: 35.h,
                        width: double.infinity,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: ListView.builder(
                            itemCount: 15,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: CustomContainerBoxShadow(
                                  width: 45.w,
                                  radius: 0,
                                  padding: EdgeInsets.zero,
                                  widgetContainer: Center(
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 3.5.h),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
