import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../local_storage/shared_preferences/preferences.dart';
import '../../widget/custom_text_widget.dart';

class DetailsTripScreen extends StatefulWidget {
  const DetailsTripScreen({Key? key}) : super(key: key);

  @override
  State<DetailsTripScreen> createState() => _DetailsTripScreenState();
}

class _DetailsTripScreenState extends State<DetailsTripScreen> {

  String select='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios)),
      ),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: (){
          setState(() {
            if(select==''){
              select='0';
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: HiveController().languageCode == 'ar'?Alignment.topRight:Alignment.topLeft,
              child: buildContainer(context),
            ),
            Expanded(child: Container()),
            CustomTextWidget(
              title:select==''?'Waiting_for_the_passenger_reach_one_of_our_cars'.tr :'Passenger_in_the_vehicle'.tr,
              style: Theme.of(context).textTheme.bodyText1,

            ),
            CustomTextWidget(
              title:select==''?'The_journey_hasnt_started_yet'.tr:'The_journey_will_start_in_minutes'.tr ,
              style: Theme.of(context).textTheme.headline1,

            ),
            Expanded(child: Container()),
            Expanded(child: Container()),
          ],
        ),
      ),
    ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
            width: 50.w,
            padding: EdgeInsets.only(left: 25,right: 25,bottom: 3,top: 3),
            decoration: BoxDecoration(
              color:Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.2, 0.2),
                    blurRadius: 5,
                    color:  Theme.of(context).shadowColor),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:   [
                    Color(0xff000000),
                    Color(0xff7D7A7A),
                  ]
              ),
            ),
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildRow('YUSUF HAFez','assets/images/user-color.png' ),
                SizedBox(height: 1.h),
                buildRow('5059158','assets/images/id_card.png'),
              ],
            ),);
  }

  Row buildRow(String title ,String image) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextWidget(
              title:title ,
              size: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xffF7FF00),

            ),
              SizedBox(width: 5.w),
              Image.asset(image,fit: BoxFit.contain,width: 20,height:20 ,),
         ///

            ],
          );
  }
}
