import 'package:flutter/material.dart';

import '../utilities/const.dart';
import 'custom_text_widget.dart';

class BuildBottomNavIcon extends StatelessWidget {
  final String label;
  final String icon;
  final bool selected;
  final Function() onClick;

  BuildBottomNavIcon(
      {required this.label, required this.icon, required this.onClick, required this.selected });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Transform.scale(scale:selected ? 1.3 : 1.2,
                    child: Image.asset(icon,color: selected ? kMainColor :    Theme.of(context).iconTheme.color,width: 20,fit: BoxFit.contain,))),
            CustomTextWidget(
              title: label,
              size: 12,
              fontWeight: FontWeight.w500,
              color: selected ? kMainColor :  Theme.of(context).iconTheme.color,
              padding: EdgeInsets.only(top: 0, bottom: 0),
            )
          ],
        ),
      ),
    );
  }
}
