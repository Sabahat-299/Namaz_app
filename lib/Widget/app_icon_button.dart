
import 'package:flutter/material.dart';
import 'package:namazreminderapp/Utils/colors.dart';

class AppIconButton extends StatelessWidget {
  IconData icon;
  Color? color;
   void Function()? onPressed;
   //name peramter and position peramter
  // poistion and name peramter hum q use karty h
  // AppIconButton(this.onPressed,this.icon,{Key? key }) : super(key: key);
   AppIconButton({Key? key,this.onPressed,required this.icon,this.color }) : super(key: key);
    @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon: Icon(icon,color:color ?? AppColor.kLightPurpleColor,),
      onPressed: onPressed,
    );
  }
}

