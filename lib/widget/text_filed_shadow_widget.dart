import 'package:flutter/material.dart';

import '../local_storage/shared_preferences/preferences.dart';
import '../utilities/const.dart';
import 'custom_container_box_shadow.dart';
import 'custom_text_filed.dart';

// ignore: must_be_immutable
class TextFiledShadowWidget extends StatefulWidget {
  String hint;
  String ?stringIcon;
  bool suffix;
  bool fillColor;
  bool suffixText;
  bool read;
  bool password;
  double? width;
  double? radius;
  bool  borderOnly;
  BorderRadius? borderRadius;
  TextEditingController? controller;
  TextInputType? keyboardType;
    TextFiledShadowWidget({Key? key,
    required this.hint,
      this.stringIcon,
      this.suffix =true,
      this.fillColor =true,
      this.width,
      this.radius,
      this.controller,
      this.borderRadius,
      this.keyboardType,
      this.read=false,
      this.borderOnly=false,
      this.password=false,
      this.suffixText=false,
    }) : super(key: key);

  @override
  State<TextFiledShadowWidget> createState() => _TextFiledShadowWidgetState();
}

class _TextFiledShadowWidgetState extends State<TextFiledShadowWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return   CustomContainerBoxShadow(
        padding: EdgeInsets.only(left: 0,right: 0),
        radius:widget.radius??28,
      borderRadius: widget.borderOnly==true?HiveController().languageCode == 'ar'? BorderRadius.only(
     ///   topRight: Radius.circular(widget.radius??28),
        topLeft: Radius.circular(widget.radius??28),
        bottomRight: Radius.circular(widget.radius??28),
        bottomLeft: Radius.circular(widget.radius??28),

      ):BorderRadius.only(
        topRight: Radius.circular(widget.radius??28),
       /// topLeft: Radius.circular(widget.radius??28),
        bottomRight: Radius.circular(widget.radius??28),
        bottomLeft: Radius.circular(widget.radius??28),
      )
          :BorderRadius.circular(widget.radius??28),
      width:widget.width??null,
        widgetContainer:TextFormField(
          readOnly: widget.read,
          controller:widget.controller ,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              suffixIcon: widget.password == true
                  ? GestureDetector(
                  onTap: _toggle,
                  child: NewWidgetIconLine(
                    line:false,
                    suffixIcon: "assets/images/eye.png",
                    widthIcon: 0,
                    width: 50,
                    colorIcon:  !_obscureText ? kMainColor :kColorText, type: 'Icon',
                  ) ):widget.suffix==true? Container(
                decoration: BoxDecoration(
                    color:widget.fillColor==true? Color(0xffDDDDDD): Theme.of(context).cardColor,
                    borderRadius: HiveController().languageCode == 'ar'? BorderRadius.only(
                      bottomLeft: Radius.circular(widget.radius??28),
                      topLeft: Radius.circular(widget.radius??28),
                    ):BorderRadius.only(
                      bottomRight: Radius.circular(widget.radius??28),
                      topRight: Radius.circular(widget.radius??28),
                    )
                ),
                child:widget.suffixText==true?
                SizedBox(
                    width: 70,
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        if(widget.fillColor==false)
                          Container(
                            width: 1,
                            height: 50,
                            color: kColorText,

                          ),

                        Text('2+' ,style: TextStyle(fontSize: 15,color: kColorText)),

                      ],
                    ))) : NewWidgetIconLine(
                  line: false,
                  suffixIcon: widget.stringIcon!, type: 'Icon',
                ),
              ):null ,
              hintText:widget.hint,
              hintStyle: TextStyle(fontSize: 13,color: kColorText),
              hoverColor: kMainColor,
              focusColor: kMainColor,

              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none),
          style: Theme.of(context).textTheme.bodyText2,
          keyboardType:widget.keyboardType ,
          obscureText: widget.password == true ? _obscureText : false,

        ));
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
