import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/AppController.dart';
import 'custom_button_widget.dart';
import 'custom_container_box_shadow.dart';
import 'custom_text_widget.dart';
class DetailsPostalWidget extends StatefulWidget {
  const DetailsPostalWidget({Key? key}) : super(key: key);

  @override
  State<DetailsPostalWidget> createState() => _DetailsPostalWidgetState();
}

class _DetailsPostalWidgetState extends State<DetailsPostalWidget> {
  String display='no';
  @override
  Widget build(BuildContext context) {
    return     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomTextWidget(
                    title: 'details'.tr,
                    style: Theme.of(context).textTheme.headline1, ),
                  SizedBox(width: 2.w),
                  InkWell(
                    onTap: () {
                      AppController.to.typePostalSelect.value='edit';
                      AppController.to.typePostalScreen.value='';
                    },
                    child: Image.asset('assets/images/edit.png',
                      color:Theme.of(context).primaryColor,
                      width: 22,fit: BoxFit.contain,),
                  )
                ],
              ),

              SizedBox(height: 10.h),
              CustomContainerBoxShadow(
                padding:
                EdgeInsets.only(left: 7, right: 7, bottom: 3),
                width: 32.w,
                radius: 10,
                widgetContainer: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      title: 'S01YS0001',
                      color: Color(0xffFF0000),
                      size: 16,
                    ),
                    Image.asset(
                      'assets/images/serial-number.png',
                      fit: BoxFit.contain,
                      width: 100,
                    )
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              CustomButtonWidget(
                  width: 32.w,
                  height: 7.h,
                  color: [
                    Color(0xff5E5E5E),
                    Color(0xffABABAB),
                  ],
                  borderRadius: 10,
                  onClick: () {
                    Get.back();
                  },
                  title: "fast_kick_out".tr),
              SizedBox(height: 3.h),
              CustomButtonWidget(
                  width: 32.w,
                  height: 7.h,
                  color: [
                    Color(0xff20B779),
                    Color(0xff6DAD72),
                  ],
                  borderRadius: 10,
                  onClick: () {
                    Get.back();
                  },
                  title: "Ismailia".tr),
              SizedBox(height: 3.h),
              InkWell(
                onTap: (){
                  setState(() {
                    if(display=='no'){
                      display='yes';
                    }else{
                      display='no';
                    }
                  });
                },
                child: Row(
                  children: [
                    CustomTextWidget(
                      title: 'View_recipient_data'.tr,
                      size: 20,
                      color: Color(0xff046B9B), ),

                    Icon(display=='no'?Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_sharp,color:  Color(0xff046B9B),size: 30,)
                  ],
                ),
              ),
              SizedBox(height: 1.5.h),
if(display=='yes')
              CustomTextWidget(
                title: 'فارس علاء محمد حسين',
                style: Theme.of(context).textTheme.bodyText2,),
              if(display=='yes')
              CustomTextWidget(
                title: ' 01227799163 2+',
                style: Theme.of(context).textTheme.bodyText2,),
            ],
          ),
        ),
        Padding(
          padding : const EdgeInsets.all(15),
          child: CustomContainerBoxShadow(
            colorFill: Theme.of(context).colorScheme.primary,
            radius: 28,
            width: 17.w,
            padding: const EdgeInsets.only( bottom: 10,top: 10),
            widgetContainer: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                    title: 'Arrived'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2),
                buildListViewIconTriangle(18.h,3,Theme.of(context).colorScheme.secondary),
                CustomTextWidget(
                    title: 'Arrived'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2),
                buildListViewIconTriangle(17.h,2,Theme.of(context).accentColor),
                CustomTextWidget(
                    title: 'Arrived'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2),
                buildListViewIconTriangle(11.h,1,Theme.of(context).dividerColor),
                CustomTextWidget(
                    title: 'awaiting_parcel'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2),
              ],

            ),

          ),
        )

      ],
    );
  }

  Widget buildListViewIconTriangle(double height,int count,Color color) {
    return Container(
      height:height,
      width: 17.w,
      ///  color: Colors.red,
      padding: EdgeInsets.only(top: 20),
      child: ListView.builder(
          itemCount: count,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Image.asset(
            'assets/images/triangle.png',
            fit: BoxFit.contain,
            width: 50,
            color: color,
          )),
    );
  }
}
