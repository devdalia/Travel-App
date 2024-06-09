import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'custom_container_box_shadow.dart';
import 'custom_text_widget.dart';

// ignore: must_be_immutable
class ContainerBuyPackage extends StatefulWidget {
  bool buy;

  ContainerBuyPackage({Key? key, this.buy = false}) : super(key: key);

  @override
  State<ContainerBuyPackage> createState() => _ContainerBuyPackageState();
}

class _ContainerBuyPackageState extends State<ContainerBuyPackage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.buy == false) {
            widget.buy = true;
          } else {
            widget.buy = false;
          }
        });
      },
      child: CustomContainerBoxShadow(
        width: 40.w,
        padding: EdgeInsets.only(bottom: 5, top: 5, right: 20, left: 20),
        colorFill: widget.buy == false ? Color(0xff21BF2D) : Color(0xffB84A4A),
        radius: 10,
        widgetContainer: Center(
          child: CustomTextWidget(
            title: widget.buy == false
                ? 'Buying_the_package'.tr
                : 'unsubscribe'.tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
