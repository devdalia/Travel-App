import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  EdgeInsetsGeometry ?padding;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? fontFamily;
  final bool? shadow;
  final TextStyle? style;
  final int? maxLines;

  CustomTextWidget(
      {this.title,
        this.color,
        this.size,
        this.maxLines,
        this.fontWeight,
        this.padding,
        this.fontFamily,
        this.style,
        this.shadow =false,
        this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? null,
      child: Text(
        title!,
        textAlign: textAlign ?? null,
        maxLines: maxLines,
        style:style?? TextStyle(
          color: color,
          fontWeight: fontWeight ?? null,
       //   fontSize: SizeConfig.scaleTextFont(size ?? 10),
          fontSize:size?? 10,
          fontFamily:fontFamily == null ? null : fontFamily,
          shadows: [
            if(shadow == true)
              Shadow(
                color: Colors.black,
                offset: Offset(0, 1),
                blurRadius: 6,
              ),

          ],
        ),
      ),
    );
  }
}
