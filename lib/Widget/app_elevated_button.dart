import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class AppElevatedButton extends StatelessWidget {
  String title;
   void Function()? onPressed;
   //
  AppElevatedButton({Key? key, required this.title,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPurpleColor,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),),),
          onPressed: onPressed,

          child: Text(title)),
    );
  }
}
