import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewWidgetHeaderScreen extends StatelessWidget {
  Function() onClickLeading;
  double padding;
  Widget widget;
  ScrollPhysics? scrollPhysics;
  NewWidgetHeaderScreen({
    Key? key,
    required this.onClickLeading,
    required this.widget,
    this.scrollPhysics,
    this.padding = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: onClickLeading, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        physics:scrollPhysics,
        padding: EdgeInsets.only(left: padding,right: padding,bottom: padding),
        child: widget,

      ),
    );
  }
}
