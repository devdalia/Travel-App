import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';

import '../utilities/const.dart';

enum BorderDirection {
  top,
  bottom,
}
// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController? textEditingController;
  String? hintText;
  TextInputType? keyboardType;
  bool password;
  bool? border;
  bool? filled;
  bool? line;
  bool  read;
  String? suffixIcon;
String  ?typeIcon;
  Color? textColor;
  Color? fillColor;
  double borderRadius;
  String? errorText;
  int max;
  TextAlign? textAlign;

  CustomTextField(
      {this.textEditingController,
      this.hintText,
      required this.max,
      this.keyboardType,
        this.errorText,
        this.suffixIcon,
      this.filled = false,
      this.read = false,
      this.typeIcon,
      this.line = false,
      this.borderRadius = 26,
      this.textAlign,
        this.border=false,
      this.textColor = const Color(0xffD2AAD6),
     required this.fillColor,
      this.password=false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    widget.textAlign=  HiveController().languageCode == 'ar'
        ? TextAlign.right
        : TextAlign.left;
    return Container(
      height:widget.max*50 ,
      margin: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        color:widget.fillColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.border==true?kColorText:Colors.white.withOpacity(.20))
      ),
      child: TextFormField(
        maxLines:widget.max,
        readOnly: widget.read,
        cursorColor: kMainColor,
textAlign:widget.textAlign!,
        // inputFormatters: [
        //   widget.keyboardType == TextInputType.phone
        //       ? LengthLimitingTextInputFormatter(10)
        //       : LengthLimitingTextInputFormatter(50)
        // ],
        controller: widget.textEditingController,
        decoration: InputDecoration(

             errorText: widget.errorText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            suffixIcon: widget.password == true
                ? GestureDetector(
                    onTap: _toggle,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                      child: NewWidgetIconLine(
                        line: widget.line!,
                        suffixIcon: "assets/images/Icon-eye.png",
                        widthIcon: 15,
                        colorIcon:  !_obscureText ? kMainColor :kColorText, type: 'Icon',
                      ),
                    )  )
                : widget.suffixIcon == null
                    ? null
                    :  NewWidgetIconLine(
              type :widget.typeIcon! ,
              line: widget.line!, suffixIcon: widget.suffixIcon!,
            ) ,

            hintText: widget.hintText,

            hintStyle: TextStyle(fontSize: 13,color: widget.textColor),
            hoverColor: kMainColor,
            focusColor: kMainColor,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            filled: widget.filled,
            fillColor: widget.fillColor),
        style:  TextStyle(fontSize: 15,color: Theme.of(context).iconTheme.color),
        showCursor: false,
        keyboardType: widget.keyboardType,
        obscureText: widget.password == true ? _obscureText : false,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

// ignore: must_be_immutable
class NewWidgetIconLine extends StatelessWidget {
  String suffixIcon;
  bool line;
  String  type;
  Color  colorIcon;
  double ?widthIcon;
  double ?width ;
    NewWidgetIconLine({
    Key? key,
    required this.suffixIcon,
    required this.type,
      this.line=false,
      this.widthIcon ,
      this.width  ,
      this.colorIcon=kColorText,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width:width?? 70,
      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(line==true)
                Container(
                  width: 1,
                  height: 50,
                  color: kColorText,

                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: type=='Icon'?
                    Image.asset(suffixIcon ,width: widthIcon??17,
                        fit: BoxFit.contain,color: colorIcon)
                        :Center(child: Text('2+' ,style: TextStyle(fontSize: 15,color: Color(0xffD2AAD6),))),
                  ),
                ),
              ],
            ),
    );
  }
}
