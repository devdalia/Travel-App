import 'dart:async';
import 'package:amwaj_car/Screen/home_client/delivery_nav/pay_screen.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import 'package:qrscan/qrscan.dart' as scanner;

import '../../../widget/custom_text_widget.dart';


class ScanBarcodePayScreen  extends StatefulWidget {
  const ScanBarcodePayScreen({Key? key}) : super(key: key);

  @override
  State<ScanBarcodePayScreen> createState() => _ScanBarcodePayScreenState();
}

class _ScanBarcodePayScreenState extends State<ScanBarcodePayScreen> {
  TextEditingController? _outputController;
  bool scan=false;
  @override
  initState() {
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          SizedBox(height: 4.h),
          Image.asset('assets/images/scanner.png',width: 200,fit: BoxFit.contain,),

          SizedBox(height: 3.5.h),
          CustomTextWidget(
            title: 'Read_payment'.tr,
            style: Theme.of(context).textTheme.headline1,
          ),     SizedBox(height: 1.5.h),
          CustomTextWidget(
            title: 'Please_put_the_barcode_inside_the_frame'.tr,
            style: Theme.of(context).textTheme.bodyText2,
          ),

          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(scan==true)
              Row(
                children: [
                  buildContainerCircle( Color(0xff0123FF).withOpacity(.33)),
                  buildContainerCircle( Color(0xff0123FF).withOpacity(.58)),
                  buildContainerCircle( Color(0xff0123FF)),
                ],
              ),

              SizedBox(width: 5.w),
              InkWell(
                onTap: _scan,
                child: CustomContainerBoxShadow(
                  radius: 50,
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(13),

                  widgetContainer: Image.asset('assets/images/photo.png',width: 15,height:15,fit: BoxFit.contain,),),
              ),
              SizedBox(width: 5.w),
              if(scan==true)
              Row(
                children: [ buildContainerCircle( Color(0xff0123FF)),
                  buildContainerCircle( Color(0xff0123FF).withOpacity(.58)),
                  buildContainerCircle( Color(0xff0123FF).withOpacity(.33)),


                ],
              ),
            ],
          ),
           Expanded(child: Container()),

        ],
      ),
    );
  }

  Container buildContainerCircle(Color color) {
    return Container(
              width: 11,
              height: 11,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color:color,
                shape: BoxShape.circle,
              ),
            );
  }
  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      scan=false;
      print('nothing return.');
    } else {

      setState(() {
        scan=true;
      });
      Navigator.of(context).push(_createRoute());
      this._outputController!.text = barcode;

    }
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const PayScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {


        return child;
      },
    );
  }
}