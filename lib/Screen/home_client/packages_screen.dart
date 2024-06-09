
import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/deposits_packages_widget.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widget/comfort_packages_widget.dart';
import '../../widget/custom_container_topshadow_to_bottom_widget.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/exchange_packages_widget.dart';
import '../../widget/swirl_packages_widget.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  List<String> titleList = [
    'Deposits_Package'.tr,
    'exchange_package'.tr,
    'swirl_bouquet'.tr,
    'comfort_package'.tr,
  ];
  List<String> change = [
    'deposits'.tr,
    'exchange'.tr,
    'swirl'.tr,
    'comfort'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () {

        if ( AppController.to.typePackagesScreen.value == 'display') {
          Get.back();
        } else {
          Get.put(AppController()).typePackagesScreen.value = 'display';
        }
      },
      widget: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GetX<AppController>(
            init: Get.put(AppController()),
            builder: (AppController controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  title: 'Buy_packages_with_various_services'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                CustomTextWidget(
                  title: 'And_keep_you_safe'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                if (controller.typePackagesScreen.value == 'display')
                  GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      mainAxisSpacing: 100,
                      crossAxisSpacing: 20,
                      children: List.generate(titleList.length, (index) {
                        return InkWell(
                          onTap: () {
                            if (index == 0) {
                              controller.typePackagesScreen.value = 'deposits';
                            }
                            if (index == 1) {
                              controller.typePackagesScreen.value = 'exchange';
                            }
                            if (index == 2) {
                              controller.typePackagesScreen.value = 'swirl';
                            }
                            if (index == 3) {
                              controller.typePackagesScreen.value = 'comfort';
                            }
                          },
                          child: CustomContainerTopShadowToBottom(
                            title: titleList[index],
                              height:  7.h,
                            listColor: [
                              kColorText,
                            Color(0xffFFFFFF),
                            ]
                          ),
                        );
                      })),
                SizedBox(height: 5.h),
                if (controller.typePackagesScreen.value == 'deposits')
                  DepositsPackagesWidget(),
                if (controller.typePackagesScreen.value == 'exchange')
                  ExchangePackagesWidget(),
                if (controller.typePackagesScreen.value == 'comfort')
                  ComfortPackagesWidget(),
                if (controller.typePackagesScreen.value == 'swirl')
                  SwirlPackagesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
