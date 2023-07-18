
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  final Widget? suffixIcon;
  final Icon? preffixIcon;
  bool obscureText = false;
  String? errorText;
  String? Function(String?)? validator;
   MyTextField({this.suffixIcon,this.preffixIcon,required this.hintText,required this.controller, required this.obscureText, this.validator,this.errorText,Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText:obscureText  ,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12),
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
                  AppColor.kLightPurpleColor)),
          errorBorder: OutlineInputBorder(
      borderRadius:
      BorderRadius.circular(10),
        borderSide: BorderSide(
            color:
            AppColor.kLightPurpleColor))
      ),
    );
  }
}
