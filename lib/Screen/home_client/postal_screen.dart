import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/widget/new_widget_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../local_storage/shared_preferences/preferences.dart';
import '../../widget/add_and_edit_postal_widget.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/details_postal_widget.dart';
import '../../widget/display_postal_widget.dart';
import '../../widget/new_widget_header_screen.dart';

class PostalScreen extends StatefulWidget {
  const PostalScreen({Key? key}) : super(key: key);

  @override
  State<PostalScreen> createState() => _PostalScreenState();
}

class _PostalScreenState extends State<PostalScreen> {
  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () {
        if (AppController.to.typePostalScreen.value == 'details') {
          AppController.to.typePostalScreen.value = 'display';
        } else if (AppController.to.typePostalSelect.value == 'edit') {
          AppController.to.typePostalScreen.value = 'details';
          AppController.to.typePostalSelect.value = '';
        } else {
          Get.back();
        }
      },
      padding: 0,
      widget: Center(
        child: GetX<AppController>(
          init: Get.put(AppController()),
          builder: (AppController controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //       SizedBox(height: 1.h),
                CustomTextWidget(
                    title: 'Send_and_receive_any_mail_at_any_time'.tr,
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(height: 3.h),
                if (controller.typePostalScreen.value == 'display')
                  Align(
                    alignment: HiveController().languageCode == 'ar'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        controller.typePostalSelect.value = 'add';
                        controller.typePostalScreen.value = '';
                      },
                      child: Container(
                        height: 10.h,
                        width: 10.w,
                        padding: EdgeInsets.only(left: 6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.5),
                          borderRadius: BorderRadius.horizontal(
                            left: HiveController().languageCode == 'ar'
                                ? Radius.circular(50.0)
                                : Radius.circular(0),
                            right: HiveController().languageCode == 'en'
                                ? Radius.circular(50.0)
                                : Radius.circular(0),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 30.sp,
                          color: Theme.of(context).cardTheme.color,
                        ),
                      ),
                    ),
                  ),
                if (controller.typePostalScreen.value == 'display')
                  SizedBox(height: 4.h),
                if (controller.typePostalScreen.value == 'display')
                  DisplayPostalWidget(),
                if (controller.typePostalScreen.value == 'details')
                  DetailsPostalWidget(),
                SizedBox(height: 4.h),
                if (controller.typePostalSelect.value == 'add' ||
                    controller.typePostalSelect.value == 'edit')
                  AddAndEditPostalWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
