
import 'package:flutter/material.dart';
import '../../widget/custom_text_widget.dart';
import 'package:sizer/sizer.dart';


// ignore: must_be_immutable
class BuildWidgetLoginRegister extends StatelessWidget {
  String title;
  String description;
  List<Widget>child;

  BuildWidgetLoginRegister({
    Key? key,
    required this.title,
    required this.description,
    required this.child,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body : Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: ListView(
                children: [
                  Center(
                    child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,height: 30.h,),
                  ),
                  CustomTextWidget(
                      title: title  ,
                      size:20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  CustomTextWidget(
                      title: description  ,
                      size: 11.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                    SizedBox(height: 2.5.h),
                  ...child
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}