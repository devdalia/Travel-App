import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Function() onClick;
  final bool? loading;
  List<Color> color;
  final double padding;
  final double height;
  final double? width;
  final Color? colorText;
  final double? fontsize;
  final double borderRadius;
  final double elevation;

  CustomButtonWidget(
      {required this.title,
      required this.onClick,
      this.loading,
      required this.color,
      this.padding = 20,
      this.height = 50,
      this.colorText = Colors.white,
      this.fontsize,
      this.borderRadius = 28,
      this.elevation = 15,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        elevation: elevation,
        shadowColor: Colors.grey.withOpacity(0.4),
        color: Colors.transparent,
        child: Container(
          height: height,
          width: width ?? null,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: padding),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: color,
              ),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: InkWell(
            onTap: onClick,
            child: loading != null && loading == true
                ? Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: Colors.white,
                      size: 50,
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                        color: colorText,
                        fontSize: fontsize??14,
                        fontWeight: FontWeight.w800),
                  ),
          ),
        ),
      ),
    );
  }
}
