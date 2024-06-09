import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/const.dart';
import '../../widget/custom_button_widget.dart';
import '../../widget/custom_container_box_shadow.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/custom_text_widget.dart';
import '../../widget/new_widget_header_screen.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String clickDrop = '';

  @override
  Widget build(BuildContext context) {
    return NewWidgetHeaderScreen(
      onClickLeading: () => Get.back(),
      padding: 18,
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextWidget(
                title: 'Contact_us'.tr, size: 20, fontWeight: FontWeight.w500),
            SizedBox(height: 3.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.all(15),
              widgetContainer: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title: 'Technical_Support'.tr,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  CustomTextWidget(
                      title:
                          'Your_important_notes_us_share_your_comments_suggestions'
                              .tr,
                      style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(height: 3.h),
                  buildRowContact('assets/images/email.png', 'support@app.com'),
                  SizedBox(height: 1.5.h),
                  buildRowContact(
                      'assets/images/phone.png', '+972 05999999999'),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/facebook.png',
                          fit: BoxFit.contain, width: 30),
                      SizedBox(width: 2.w),
                      Image.asset('assets/images/twitter.png',
                          fit: BoxFit.contain, width: 30),
                      SizedBox(width: 2.w),
                      Image.asset('assets/images/instagram.png',
                          fit: BoxFit.contain, width: 37),
                      SizedBox(width: 2.w),
                      Image.asset('assets/images/linkedin.png',
                          fit: BoxFit.contain, width: 30),
                      SizedBox(width: 2.w),
                      Image.asset('assets/images/whatsapp.png',
                          fit: BoxFit.contain, width: 30),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Container(
                  height: 4.h,
                  width: 2,
                  color: kMainColor22,
                ),
                SizedBox(width: 4.w),
                CustomTextWidget(
                    title: 'Encourage_us'.tr,
                    size: 20,
                    fontWeight: FontWeight.w500),
              ],
            ),
            SizedBox(height: 2.h),
            CustomContainerBoxShadow(
              padding: EdgeInsets.all(15),
              widgetContainer: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kColorText)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                                title: 'Inquiry_request_about_a_service'.tr,
                                size: 13,
                                color: Theme.of(context).hintColor),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: kColorText,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0.3.h,
                        right: 7.w,
                        child: Container(
                          color: Theme.of(context).backgroundColor,
                          child: CustomTextWidget(
                            title: 'inquiry'.tr,
                            size: 8,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  CustomTextField(
                    hintText: 'Your_identifier_number'.tr,
                    border: true,
                    max: 1,
                    fillColor: Theme.of(context).backgroundColor,
                    textColor: Theme.of(context).hintColor,
                    borderRadius: 10,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 1.5.h),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kColorText)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                              cursorColor: kMainColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                hintText: 'Mobile_No'.tr,
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context).hintColor),
                                hoverColor: kMainColor,
                                focusColor: kMainColor,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor),
                              showCursor: true,
                              keyboardType: TextInputType.phone),
                        ),
                        Container(
                          width: 29.w,
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1.0, color: kColorText),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomTextWidget(
                                title: 'PL',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const Icon(Icons.keyboard_arrow_down_sharp,
                                  color: kColorText),
                              SizedBox(width: 2.w),
                              CustomTextWidget(
                                title: '970+',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(width: 1.0.w),
                              Image.asset(
                                "assets/images/Palestinian_Shekel.png",
                                fit: BoxFit.contain,
                                width: 20,
                              ),
                              SizedBox(width: 2.0.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  CustomTextField(
                    hintText: 'The_full_name_Arabic'.tr,
                    border: true,
                    max: 1,
                    fillColor: Theme.of(context).backgroundColor,
                    textColor: Theme.of(context).hintColor,
                    borderRadius: 10,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 1.5.h),
                  CustomTextField(
                    hintText: 'message'.tr,
                    border: true,
                    max: 2,
                    fillColor: Theme.of(context).backgroundColor,
                    textColor: Theme.of(context).hintColor,
                    borderRadius: 10,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            CustomButtonWidget(
                width: 65.0.w,
                height: 50,
                color: [
                  Color(0xff920BA7),
                  Color(0xffA20F0F),
                ],
                borderRadius: 20,
                onClick: () {
                  Get.back();
                },
                title: "Send".tr),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget buildRowContact(String image, String title) {
    return Row(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          width: 18,
          color: Theme.of(context).iconTheme.color,
        ),
        SizedBox(width: 3.w),
        Text(
          title,
          style: TextStyle(
              fontSize: 14,
              color: kMainColor22,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
