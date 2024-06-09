import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomContainerBoxShadow extends StatelessWidget {
  Widget ?widgetContainer;
  EdgeInsets ?padding;
  double ?height;
  double ?width;
  double  radius;
  Color ?colorFill;
  BorderRadius ?borderRadius;
  bool border;
 double ?dx; double ?dy;
  AlignmentGeometry? alignment;
    CustomContainerBoxShadow({Key? key,  this.widgetContainer,
        this.padding,   this.height,this.width,this.alignment,
      this.colorFill,
      this.borderRadius,
      this.dx,
      this.dy,
      this.border=false,
      this.radius=15}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:padding,
     width:width??null ,
      height: height??null,
      decoration: BoxDecoration(
         color:colorFill?? Theme.of(context).cardColor,
        borderRadius:borderRadius??  BorderRadius.circular(radius),
        border: Border.all(color: border==true?Theme.of(context).accentColor:
        colorFill?? Theme.of(context).cardColor),
        boxShadow: [
          BoxShadow(
              offset: Offset(dx??0.2,dy?? 0.2),
              blurRadius: 7,
              color:Theme.of(context).shadowColor),
        ],
      ),
      child: widgetContainer,
    );
  }
}
