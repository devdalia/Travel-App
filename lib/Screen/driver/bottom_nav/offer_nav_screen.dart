

 import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class OfferNavScreen extends StatelessWidget  {
   const OfferNavScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return    Scaffold(
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       body: Center(
         child: CustomTextWidget(
           title: 'Administrative_instructions_and_decisions'.tr,
           size: 20,
           fontWeight: FontWeight.w500,
           color: Theme.of(context).iconTheme.color,
           textAlign: TextAlign.center,
           padding: EdgeInsets.only(top: 30, bottom: 0),
         ),
       ),
     );
   }
 }
