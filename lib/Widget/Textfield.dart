
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  final Icon? suffixIcon;
  final Icon? preffixIcon;
   MyTextField({this.suffixIcon,this.preffixIcon,required this.hintText,required this.controller,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: AppColor.kLightPurpleColor,
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  AppColor.kLightPurpleColor))),
    );
  }
}
