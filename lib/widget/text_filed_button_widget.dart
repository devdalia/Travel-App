import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
// ignore: must_be_immutable
class TextFiledButtonWidget extends StatelessWidget {

  String hint;
  String but;
  Function ()click;
  final bool? loading;
  TextEditingController? textEditingController;
    TextFiledButtonWidget({Key? key,
      required this.hint,
      required this.but,
      this.loading,
      required this.click,
      this.textEditingController
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 7.1.h,
      padding:HiveController().languageCode == 'ar'? EdgeInsets.only( right: 15):EdgeInsets.only(left: 15,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.2, 0.2),
              blurRadius: 2,
              color:  Theme.of(context).shadowColor),
        ],
      ),
      child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
          decoration: InputDecoration(

              suffixIcon: InkWell(
                onTap: click,
                child: Container(
                  height: 7.1.h,
                  width: 17.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:kPrimerColor,
                      borderRadius:HiveController().languageCode == 'ar'? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ):BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )
                  ),
                  child:  loading != null && loading == true
                      ? Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: Colors.white,
                      size: 35,
                    ),
                  )
                      :CustomTextWidget(
                      title:but,
                      size:12,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold),
                ),
              ),
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.subtitle1,
              border: InputBorder.none),
          textInputAction: TextInputAction.done,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.number),
    );
  }
}
