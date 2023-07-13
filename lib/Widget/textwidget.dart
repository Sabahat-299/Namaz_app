
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String title;
  double? fontSize;
  Color? color;
  String? fontFamily;
  FontWeight? fontWeight;

  TextWidget({Key? key,required this.title,this.fontSize, this.color,this.fontFamily,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(title,style:TextStyle(
        fontSize: fontSize,color: color,
      fontFamily: fontFamily,
      fontWeight:fontWeight,


    ));
  }
}
